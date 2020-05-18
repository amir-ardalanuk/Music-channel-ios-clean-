//
//  File.swift
//  AANetworkProvider
//
//  Created by Amir Ardalan on 5/14/20.
//  Copyright © 2020 Clean-Coder. All rights reserved.
//

import UIKit

protocol BaseCourseCell where Self : CollectionCell{
    typealias T = BaseCourseModel
    func config(course:BaseCourseModel)
}
