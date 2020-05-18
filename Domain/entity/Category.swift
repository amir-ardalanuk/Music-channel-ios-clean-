//
//  Category.swift
//  Domain
//
//  Created by Amir Ardalan on 4/25/20.
//  Copyright © 2020 Clean-Coder. All rights reserved.
//

import Foundation
public struct CategoryList : Codable {
    public let categories : [Category]?
}

public struct Category : Codable {
    public var  name : String?
}
