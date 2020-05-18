//
//  Gradiantavble.swift
//  AANetworkProvider
//
//  Created by Amir Ardalan on 5/13/20.
//  Copyright © 2020 Clean-Coder. All rights reserved.
//

import UIKit

protocol Gradiantable {}

extension Gradiantable where Self : UIView {
    func setGradiant(withColors colors : [UIColor])->CAGradientLayer{
        let layer =  CAGradientLayer()
        layer.frame = self.bounds
        layer.colors = colors
        layer.startPoint = CGPoint(x: 1.0, y: 0.0)
        layer.endPoint = CGPoint(x : 0.0,y: 0.0)
        layer.sublayers?.forEach({ (subLayer) in
            if subLayer is CAGradientLayer {
               subLayer.removeFromSuperlayer()
            }
        })
        self.layer.insertSublayer(layer, at: 0)
        return layer
    }
}
