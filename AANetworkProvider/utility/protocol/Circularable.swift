//
//  Circuelable.swift
//  AANetworkProvider
//
//  Created by Amir Ardalan on 5/13/20.
//  Copyright © 2020 Clean-Coder. All rights reserved.
//

import UIKit


protocol Circularable {
    func setCircular()
}
extension Circularable where Self : UIView {
    
    func setCircular(){
        self.layer.cornerRadius = self.bounds.height / 2
        self.clipsToBounds = true
    }
    
    func setCircular(radius: CGFloat){
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
    
}
