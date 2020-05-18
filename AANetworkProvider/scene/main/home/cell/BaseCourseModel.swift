//
//  BaseCourseModel.swift
//  AANetworkProvider
//
//  Created by Amir Ardalan on 5/15/20.
//  Copyright © 2020 Clean-Coder. All rights reserved.
//

import Foundation
protocol BaseCourseModel {
   var id:String{get set}
   var imagePath:String?{get set}
   var title:String?{get set}
}
