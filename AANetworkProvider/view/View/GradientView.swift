//
//  GradientView.swift
//  AANetworkProvider
//
//  Created by Amir Ardalan on 5/13/20.
//  Copyright © 2020 Clean-Coder. All rights reserved.
//

import UIKit

class GradiantView: CustomView, Gradiantable, Circularable {
    
    var gradient: CAGradientLayer!
    
    @IBInspectable
    var isCircular: Bool = false {
        didSet {
            if isCircular {
                setCircular()
            } else {
                setCircular(radius: 0)
            }
        }
    }
    
    @IBInspectable
    var startColor: UIColor = .clear {
        didSet {
            setup()
        }
    }
    
    @IBInspectable
    var endColor: UIColor = .clear {
        didSet {
            setup()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setup()
    }
    
    func setup() {
        gradient = setGradiant(withColors: [
        startColor,
        endColor
        ])
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        gradient.frame = self.bounds
    }
}
