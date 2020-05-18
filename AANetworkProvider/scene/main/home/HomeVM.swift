//
//  HomeVM.swift
//  AANetworkProvider
//
//  Created by Amir Ardalan on 4/19/20.
//  Copyright © 2020 Clean-Coder. All rights reserved.
//

import Foundation
import Domain
import RxSwift
import RxCocoa


struct HomeViewModel : ViewModel {
    
    var output: ViewModelOutPut?
    let bag = DisposeBag()
    
    var mediaRepositoy:MediaServices!
    init(productRepositoy:MediaServices) {
        self.mediaRepositoy = productRepositoy
    }
    
    func transform(input: HomeViewModel.Input) -> HomeViewModel.Output {
        
        let indicator = ActivityIndicator()
        let errorTracker = ErrorTracker()
        //
        let newEdpisodeSection = newEpisode().trackError(errorTracker).trackActivity(indicator).map{ ChannelSectionModel(id: "NewEpisode", imagePath: nil,
                                                                       title: "New Episode",
                                                                       desc: nil,
                                                                       item: $0?.media?.map{ CourseModel(id: $0.type ?? "",
                                                                                                         imagePath: $0.coverAsset?.url,
                                                                                                         title: $0.title,
                                                                                                         desc: $0.channel?.title)  } ?? [] ,
                                                                       type: .newEpisode) }
        let channelSectionSeries : Observable<[ChannelSectionModel]> = channelList()
            .trackError(errorTracker)
            .trackActivity(indicator)
            .map{ channel in
                (channel?.channels?
                    .map{
                        let isEpisode = ($0.series?.isEmpty ?? true)
                        return ChannelSectionModel(id:$0.id,
                                                   imagePath: $0.iconAsset?.thumbnailUrl,
                                                   title: $0.title,
                                                   desc: "\($0.mediaCount ?? 0) \(isEpisode ? "episodes": "series" )",
                            item:$0.latestMedia?.map{
                                CourseModel(id: $0.title ?? "", imagePath: $0.coverAsset?.url, title: $0.title, desc: $0.type) } ?? [] ,
                            type: isEpisode ? .normal : .seri)
                    } ?? [] )
        }
        
        let categorySection = self.categoryList()
                .trackError(errorTracker)
                .trackActivity(indicator)
                .map({ (list) -> ChannelSectionModel in
                    return ChannelSectionModel(id: "category",
                                                                  imagePath: nil,
                                                                  title: "Category",
                                                                  desc: nil,
                                                                  item: list?.categories?.map{
                                                                   CourseModel(id: $0.name ?? "-", title: $0.name ?? "-")  } ?? [] ,
                                                                  type: .cateogory)
        })
        
        
        
        
        let list = input.getHomeItem.flatMapLatest { (_) -> Driver<[ChannelSectionModel]> in
            return Observable.zip(newEdpisodeSection,channelSectionSeries,categorySection).map{ items -> [ChannelSectionModel] in
                let array : [ChannelSectionModel] = [items.0] + items.1 + [items.2]
                return array
            }.asDriverOnErrorJustComplete()
        }
        
        
        let loading = indicator.asDriver()
        let error = errorTracker.asDriver()
        
        return HomeViewModel.Output( sectionModel: list, loading: loading, error: error)
    }
    
    func newEpisode() -> Observable<MediaList?> {
        return mediaRepositoy.getMediaList()
    }
    
    func channelList() -> Observable<ChannelList?> {
        return mediaRepositoy.getChannelList()
    }
    
    func categoryList() -> Observable<CategoryList?> {
        return mediaRepositoy.getCategoryList()
    }
    
}
extension HomeViewModel {
    struct Input {
        //  let selectedItem: Driver<Product>
        let getHomeItem : Driver<Void>
    }
    
    struct Output {
        let sectionModel: Driver<[ChannelSectionModel]>
        let loading:Driver<Bool>
        let error: Driver<Error>
        
    }
}
