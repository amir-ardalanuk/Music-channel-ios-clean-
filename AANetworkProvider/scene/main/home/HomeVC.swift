//
//  HomeVC.swift
//  AANetworkProvider
//
//  Created by Amir Ardalan on 4/19/20.
//  Copyright © 2020 Clean-Coder. All rights reserved.
//

import UIKit
import RxSwift
import Domain
import RxCocoa

class HomeVC: UIViewController {
    

    @IBOutlet private weak var tableView : UITableView!{
        didSet{
            self.tableView.dataSource = homeDataSource
            self.tableView.register(ChannelSectionCell.self)
        }
    }
    private let bag = DisposeBag()
    
    var viewModel: HomeViewModel!
    private var homeDataSource = HomeDataSource()

    private var getListTrigger = PublishSubject<Void>()
    private lazy var refresher : UIRefreshControl = {
        let refresher = UIRefreshControl()
        return refresher
    }()
    
}

extension HomeVC{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
        self.getListTrigger.onNext(())
    }
    
    func bind(){
        
        let input = HomeViewModel.Input(getHomeItem: getListTrigger.asDriverOnErrorJustComplete())
        
        let output = viewModel.transform(input: input)
        
        output.loading.asObservable().bind(to: self.refresher.rx.refreshing).disposed(by: bag)
        output.sectionModel.asObservable().bind(to: self.tableView.rx.homeDataSourceList).disposed(by: bag)
        
    }
}



extension Reactive where Base:UITableView {
    internal var homeDataSourceList: Binder<[ChannelSectionModel]> {
        return Binder(self.base, binding: { (view, data) in
            if let datasource = view.dataSource as? HomeDataSource {
                datasource.updateList(data)
                view.reloadData()
            }
        })
    }
}



extension Reactive where Base:HomeDataSource {
    internal var homeDataSourceList: Binder<[ChannelSectionModel]> {
        return Binder(self.base, binding: { (view, data) in
            view.updateList(data)
        })
    }
}
