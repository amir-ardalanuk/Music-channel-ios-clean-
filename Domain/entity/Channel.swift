//
//  Channel.swift
//  Domain
//
//  Created by Amir Ardalan on 5/12/20.
//  Copyright © 2020 Clean-Coder. All rights reserved.
//

import Foundation
public struct ChannelList : Codable {

    public let channels : [Channel]?


    enum CodingKeys: String, CodingKey {
        case channels = "channels"
    }
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        channels = try values.decodeIfPresent([Channel].self, forKey: .channels)
    }


}
public class BaseChannel:Codable {
   public var title : String?
}

public class Channel : BaseChannel {

    public let coverAsset : CoverAsset?
    public let iconAsset : IconAsset?
    public let id : String?
    public let latestMedia : [BaseMedia]?
    public let mediaCount : Int?
    public let series : [Sery]?
    public let slug : String?


    enum CodingKeys: String, CodingKey {
        case coverAsset
        case iconAsset = "iconAsset"
        case id = "id"
        case latestMedia = "latestMedia"
        case mediaCount = "mediaCount"
        case series = "series"
        case slug = "slug"
        case title = "title"
    }
    public required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        coverAsset = try CoverAsset(from: decoder)
        iconAsset = try values.decodeIfPresent(IconAsset.self, forKey: .iconAsset)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        latestMedia = try values.decodeIfPresent([BaseMedia].self, forKey: .latestMedia)
        mediaCount = try values.decodeIfPresent(Int.self, forKey: .mediaCount)
        series = try values.decodeIfPresent([Sery].self, forKey: .series)
        slug = try values.decodeIfPresent(String.self, forKey: .slug)
        try super.init(from: decoder)
    }


}
public struct Sery : Codable {

   public let coverAsset : CoverAsset?
    public let title : String?


    enum CodingKeys: String, CodingKey {
        case coverAsset
        case title = "title"
    }
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        coverAsset = try CoverAsset(from: decoder)
        title = try values.decodeIfPresent(String.self, forKey: .title)
    }


}

public class BaseMedia :Codable {

   public var coverAsset : CoverAsset?
   public var title : String?
   public var type : String?
}
public struct IconAsset : Codable {

    public let thumbnailUrl : String?
}
