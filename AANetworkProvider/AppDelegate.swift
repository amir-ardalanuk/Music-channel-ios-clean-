//
//  AppDelegate.swift
//  AANetworkProvider
//
//  Created by Amir Ardalan on 3/28/20.
//  Copyright © 2020 Clean-Coder. All rights reserved.
//

import UIKit
import SwinjectStoryboard

@UIApplicationMain
class AppDelegate: UIResponder {
    
    var window: UIWindow?
    let mainAssembler = MainAssembler()
    
    override init() {
        super.init()
        
    }
    
    
}

extension AppDelegate :UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        setupWindow()
        return true
    }
    
    func setupWindow(){
        let window  = UIWindow(frame: UIScreen.main.bounds)
        window.makeKeyAndVisible()
        
        let storyboard = SwinjectStoryboard.create(name: "Main", bundle: nil)
        
        window.backgroundColor = .black
        window.rootViewController = storyboard.instantiateInitialViewController()
        
        self.window = window
        
    }
}
