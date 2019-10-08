//
//  Listing.swift
//  Classifieds
//
//  Created by Rizwan Saleem on 10/7/19.
//  Copyright © 2019 Rizwan Saleem. All rights reserved.
//

import ObjectMapper

class Listing: NSObject, Mappable {
    
    var result: [Item]?
    var listingPagination: Pagination?
    
    override init() {
        super.init()
    }
    
    required init?(map: Map) {
        
        
    }
    
    func mapping(map: Map) {
        result <- map["results"]
        listingPagination <- map["pagination"]
    }
}

class Item: NSObject, Mappable {
    
    var createdAt: String?
    var price: String?
    var name: String?
    var UID: String?
    var imageIds: [String]?
    var imageUrl: [String]?
    var imageUrlThumbnail: [String]?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        createdAt <- map["created_at"]
        price <- map["price"]
        name <- map["name"]
        UID <- map["uid"]
        imageIds <- map["image_ids"]
        imageUrl <- map["image_urls"]
        imageUrlThumbnail <- map["image_urls_thumbnails"]
    }
}

class Pagination: NSObject, Mappable {
    var key: String?

    required init?(map: Map) {

    }

    func mapping(map: Map) {

    }
}
