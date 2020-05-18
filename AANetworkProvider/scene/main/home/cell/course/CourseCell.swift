//
//  CourseCell.swift
//  AANetworkProvider
//
//  Created by Amir Ardalan on 5/13/20.
//  Copyright © 2020 Clean-Coder. All rights reserved.
//

import UIKit
import Kingfisher

class CourseCell: CollectionCell{
    
    enum CourseType :String {
        case normal = "normal"
        case newEpisode = "newEpisode"
    }
    
    @IBOutlet weak var imageContainer: CustomView!
    @IBOutlet weak var courseImage: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDesc: UILabel!
    
}

extension CourseCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setType(type:CourseType){
        switch type {
        case .newEpisode:
            lblDesc.isHidden = false
        case .normal:
            lblDesc.isHidden = true
        }
    }
}

extension CourseCell:BaseCourseCell {
    
    func config(course: BaseCourseModel) {
        self.lblTitle.text = course.title
        if let imageUrl = URL(string:course.imagePath ?? "") {
            self.courseImage.kf.setImage(with: imageUrl)
        }
        guard let courseModel  = course as? CourseModel else{
            return
        }
        self.lblDesc.text = courseModel.desc
    }
    
    
}
