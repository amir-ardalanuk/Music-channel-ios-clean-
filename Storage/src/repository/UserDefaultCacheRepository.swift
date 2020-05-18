//
//  CacheRepositoryImp.swift
//  Storage
//
//  Created by Amir Ardalan on 5/17/20.
//  Copyright © 2020 Clean-Coder. All rights reserved.
//

import Foundation
import RxSwift
import Swinject

open class UserDefaultCacheRepositry: CacheRepository {
    
    public init(){}
    
    public func retrive<T>(key: String, type: T.Type) -> Observable<T?> where T : Decodable, T : Encodable {
        Observable.create { (observer) -> Disposable in
            
            if let data = UserDefaults.standard.value(forKey: key) as? Data,
                let dataModel = try? JSONDecoder().decode(T.self, from: data) {
                observer.onNext(dataModel)
            }
            observer.onNext(nil)
            
            return Disposables.create {}
        }
    }
    
    
    
    public func save<T>(key: String, value: T) where T : Decodable, T : Encodable {
        if let data = try? JSONEncoder().encode(value) {
            UserDefaults.standard.set(data, forKey:key)
        }
    }
    
}
extension UserDefaultCacheRepositry : Assembly {
    public func assemble(container: Container) {
         container.register(UserDefaultCacheRepositry.self) { (r) in
                  return UserDefaultCacheRepositry()
         }.inObjectScope(.weak)
    }
    
    
}
