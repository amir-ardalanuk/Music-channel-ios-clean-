//
//  ChannelModel.swift
//  AANetworkProvider
//
//  Created by Amir Ardalan on 5/13/20.
//  Copyright © 2020 Clean-Coder. All rights reserved.
//

import Foundation

struct ChannelSectionModel{
    
    enum ChannelType:String {
        case newEpisode = "newEpisode"
        case normal = "normal"
        case seri = "seri"
        case cateogory = "category"
    }
    
    let id:String?
    let imagePath: String?
    let title: String?
    let desc:String?
    let item :[CourseModel]
    let type:ChannelType
    
}
