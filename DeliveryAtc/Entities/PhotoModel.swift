//
//  PhotoModel.swift
//  DeliveryAtc
//
//  Created by Kirill Bulychev on 09/09/2019.
//  Copyright © 2019 Kirill Bulychev. All rights reserved.
//

import Foundation

class PhotoModel: AbstractModel, Codable {
    var albumId: Int
    var id: Int
    var title: String
    var url: String
    var thumbnailUrl: String
    
    required init() {
        self.albumId = 0
        self.id = 0
        self.title = ""
        self.url = ""
        self.thumbnailUrl = ""
    }
    
    override func initByDictionary(dictionary: [String : Any]) {
        self.albumId = dictionary["albumId"] as? Int ?? 0
        self.id = dictionary["id"] as? Int ?? 0
        self.title = dictionary["title"] as? String ?? ""
        self.url = dictionary["url"] as? String ?? ""
        self.thumbnailUrl = dictionary["thumbnailUrl"] as? String ?? ""
    }
}
