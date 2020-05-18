//
//  CacheRepository.swift
//  Storage
//
//  Created by Amir Ardalan on 5/17/20.
//  Copyright © 2020 Clean-Coder. All rights reserved.
//

import Foundation
import RxSwift
public protocol CacheRepository {
    
    func save<T:Codable>(key:String,value:T)
    func retrive<T:Codable>(key:String,type:T.Type)->Observable<T?>
}
