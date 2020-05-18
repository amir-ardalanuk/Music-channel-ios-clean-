//
//  MainAssembler.swift
//  AANetworkProvider
//
//  Created by Amir Ardalan on 4/26/20.
//  Copyright © 2020 Clean-Coder. All rights reserved.
//

import Foundation
import Swinject
import SwinjectStoryboard
import AANetwork
import Data
import Storage

class MainAssembler {
    var resolver : Resolver {
        return assembler.resolver
    }
    
    let assembler = Assembler(container: SwinjectStoryboard.defaultContainer)
    
    init() {
        assembler.apply(assembly: URLSessionNetwork())
        assembler.apply(assembly: RequesterAssembly())
        assembler.apply(assembly: RepositoryManagerAssembly())
        assembler.apply(assembly: UserDefaultCacheRepositry())
        
        assembler.apply(assembly: HomeVCAssembly())
    }
}
