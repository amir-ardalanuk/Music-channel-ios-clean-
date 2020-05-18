//
//  SeriesCell.swift
//  AANetworkProvider
//
//  Created by Amir Ardalan on 5/15/20.
//  Copyright © 2020 Clean-Coder. All rights reserved.
//

import UIKit

class SeriesCell: CollectionCell {
    
    @IBOutlet weak var imgContainer: CustomView!
    @IBOutlet weak var imgSery: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    
}
extension SeriesCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
extension SeriesCell : BaseCourseCell {
    
    func config(course: BaseCourseModel) {
        self.lblTitle.text = course.title
        if let imageUrl = URL(string:course.imagePath ?? "") {
            self.imgSery.kf.setImage(with: imageUrl)
        }
        
    }
    
    
}
