//
//  Product.swift
//  Domain
//
//  Created by Amir Ardalan on 4/25/20.
//  Copyright © 2020 Clean-Coder. All rights reserved.
//

import Foundation

public struct MediaList : Codable {

    public var media : [Media]?
}

public struct Media : Codable {

    public var channel : BaseChannel?
    public var coverAsset : CoverAsset?
    public var title : String?
    public var type : String?

}

public struct CoverAsset : Codable {

    public let url : String?
}
