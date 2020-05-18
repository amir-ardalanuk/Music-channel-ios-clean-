//
//  RxCoco+ex.swift
//  AANetworkProvider
//
//  Created by Amir Ardalan on 4/26/20.
//  Copyright © 2020 Clean-Coder. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift
import UIKit

extension Reactive where Base:UIRefreshControl {
    
    public var refreshing: Binder<Bool?> {
        return Binder(self.base, binding: { (view, data) in
            let refreshing = data ?? false
            if(refreshing){
                view.beginRefreshing()
            }else{
                view.endRefreshing()
            }
        })
        
    }
}
