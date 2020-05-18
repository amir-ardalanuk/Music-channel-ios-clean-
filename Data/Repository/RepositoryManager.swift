//
//  RepositoryManager.swift
//  Data
//
//  Created by Amir Ardalan on 4/26/20.
//  Copyright © 2020 Clean-Coder. All rights reserved.
//

import Foundation
import AANetwork
import Swinject
import Storage

public struct RepositoryManager {
    
    let requester : NetworkRequest
    let cache : CacheRepository
    init(requester : NetworkRequest , cache : CacheRepository) {
        self.requester = requester
        self.cache = cache
    }
    
    public lazy var mediaRepository:DefaultMediaService = {
        return DefaultMediaService(network: self.requester, cache: self.cache)
    }()
    
}

public class RepositoryManagerAssembly : Assembly {
    public init() {
        
    }
    public func assemble(container: Container) {
           container.register(RepositoryManager.self) { (r) in
               let requester = r.resolve(Requester.self)
            let cache = r.resolve(UserDefaultCacheRepositry.self)
            return RepositoryManager(requester: requester!,cache: cache!)
           }.inObjectScope(.weak)
       }
    
    
    
}
