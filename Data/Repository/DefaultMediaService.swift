//
//  GeneralAuthorization.swift
//  Data
//
//  Created by Amir Ardalan on 4/19/20.
//  Copyright © 2020 Clean-Coder. All rights reserved.
//

import Foundation
import AANetwork
import Domain
import Storage
import RxSwift
import RxCocoa

public class DefaultMediaService {
   
    let network:NetworkRequest
    let cache:CacheRepository
    
    public init(network:NetworkRequest,cache:CacheRepository) {
        self.network = network
        self.cache = cache
    }
    
}


extension DefaultMediaService : MediaServices {
    public func getMediaList() -> Observable<MediaList?> {
        
        let provider = DefaultNetworkProvider.make(route: NewEpisodeSection.MediaList.route.endpoint)
        
        return Observable.zip(
                        network.hasConnection(),
                        cache.retrive(key: provider.endPoint, type:MediaList.self),
                        network.makeRXRequest(provider: provider, ofType: Response<MediaList>.self).asObservable()
        ) { (isConnected,cacheData,remoteData) -> MediaList? in
            
            if !isConnected , cacheData != nil  {
                return cacheData
            }else{
                if let data = remoteData.data {
                    self.cache.save(key: provider.endPoint, value: data)
                }
                
                return remoteData.data
            }
        }
    }
    
    public func getChannelList() -> Observable<ChannelList?> {
        let provider = DefaultNetworkProvider.make(route: ChannelSection.channelList.route.endpoint)
        return Observable.zip(
                               network.hasConnection(),
                               cache.retrive(key: provider.endPoint, type:ChannelList.self),
                               network.makeRXRequest(provider: provider, ofType: Response<ChannelList>.self).asObservable()
               ) { (isConnected,cacheData,remoteData) -> ChannelList? in
                   
                   if !isConnected , cacheData != nil  {
                       return cacheData
                   }else{
                       if let data = remoteData.data {
                           self.cache.save(key: provider.endPoint, value: data)
                       }
                       
                       return remoteData.data
                   }
               }
    }
    
    public func getCategoryList() -> Observable<CategoryList?> {
        
        let provider = DefaultNetworkProvider.make(route: CategorySection.categoryList.route.endpoint)
        return Observable.zip(
                        network.hasConnection(),
                        cache.retrive(key: provider.endPoint, type:CategoryList.self),
                        network.makeRXRequest(provider: provider, ofType: Response<CategoryList>.self).asObservable()
        ) { (isConnected,cacheData,remoteData) -> CategoryList? in
            
            if !isConnected , cacheData != nil  {
                return cacheData
            }else{
                if let data = remoteData.data {
                    self.cache.save(key: provider.endPoint, value: data)
                }
                
                return remoteData.data
            }
        }
    }
}

extension Encodable {
    
    /// Converting object to postable dictionary
    func toDictionary(_ encoder: JSONEncoder = JSONEncoder()) throws -> [String: Any] {
        let data = try encoder.encode(self)
        let object = try JSONSerialization.jsonObject(with: data)
        guard let json = object as? [String: Any] else {
            let context = DecodingError.Context(codingPath: [], debugDescription: "Deserialized object is not a dictionary")
            throw DecodingError.typeMismatch(type(of: object), context)
        }
        return json
    }
}
