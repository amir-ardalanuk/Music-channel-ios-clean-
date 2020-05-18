//
//  AANetworkMockImp.swift
//  AANetworkTests
//
//  Created by Amir Ardalan on 4/24/20.
//  Copyright © 2020 Clean-Coder. All rights reserved.
//

import Foundation
@testable import AANetwork
class INetworkMockImp : BaseNetwork {
 
    var result : BaseNetworkCallBack?
    var _cancel = false
    
    init() {}
    
    func setResult(result:BaseNetworkCallBack){
        self.result = result
    }
    
    
    
    func load(url: String, method: BaseNetworkMethod, payload: Any?, decoder: BaseNetworkDecoder, complete: @escaping (BaseNetworkCallBack) -> Void) {
        guard let _result = self.result else {
            print( NetworkError.couldNotMapToClass)
            fatalError("SET RESULT SHtit")
            return
        }
        complete(_result)
    }
    func isConnectedToIntenet() -> Bool {
         return true
     }
     
    
    func cancel() {
        self._cancel = true
    }
    
    
}
