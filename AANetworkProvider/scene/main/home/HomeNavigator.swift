//
//  HomeNavigator.swift
//  AANetworkProvider
//
//  Created by Amir Ardalan on 4/27/20.
//  Copyright © 2020 Clean-Coder. All rights reserved.
//

import Foundation
import Swinject
import SwinjectStoryboard
import Data

struct HomeNavigator {
}

class HomeVCAssembly : Assembly {
    func assemble(container: Container) {
        container.storyboardInitCompleted(HomeVC.self) { (r, c) in
            
            var repositoryManagement = r.resolve(RepositoryManager.self)!
            
            c.viewModel = HomeViewModel(productRepositoy: repositoryManagement.mediaRepository)
            
        }
    }
}
