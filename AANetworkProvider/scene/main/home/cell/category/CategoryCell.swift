//
//  CategoryCell.swift
//  AANetworkProvider
//
//  Created by Amir Ardalan on 5/17/20.
//  Copyright © 2020 Clean-Coder. All rights reserved.
//

import UIKit
import Domain

class CategoryCell: CollectionCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var containerView: CustomView!{
        didSet{
            self.containerView.layer.cornerRadius = self.containerView.frame.height / 2
        }
    }
  
}

extension CategoryCell {
    
    
      override func awakeFromNib() {
          super.awakeFromNib()
          // Initialization code
      }
    
    func config(category : CategoryeModel){
        self.lblTitle.text = category.title
    }
}
