//
//  BaseNetwork+enum.swift
//  AANetwork
//
//  Created by Amir Ardalan on 4/24/20.
//  Copyright © 2020 Clean-Coder. All rights reserved.
//

import Foundation
public enum BaseNetworkMethod:String {
    case post = "POST"
    case get = "GET"
    case delete = "DELETE"
    case patch = "PATCH"
}

public enum BaseNetworkDecoder:String {
    case json = "Json"
    case param = "Param"
}


public enum BaseNetworkCallBack{
    case success(BaseNetworkResult)
    case failure(BaseNetworkResult)
    
    var data : Any? {
        switch self {
            case .failure(let e):
                return e.data
            case .success(let s):
                return s.data
            }
    }
    
    var statusCode : Int?{
        switch self {
        case .failure(let e):
            return e.status
        case .success(let s):
            return s.status
        }
    }
    
    var error : Error?{
           switch self {
           case .failure(let e):
            return e.error
           case .success(let s):
            return s.error
           }
       }
}

public struct BaseNetworkResult {
    public var status:Int?
    public var error:Error?
    public var data:Data?
   
}
