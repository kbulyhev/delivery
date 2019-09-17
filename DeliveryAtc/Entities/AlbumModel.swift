//
//  PhotoModel.swift
//  DeliveryAtc
//
//  Created by Kirill Bulychev on 08/09/2019.
//  Copyright © 2019 Kirill Bulychev. All rights reserved.
//
import Foundation

class AlbumModel: AbstractModel, Codable {
    var userId: Int
    var id: Int
    var title: String?
    
    required init() {
        self.userId = 0
        self.id = 0
        self.title = ""
    }
    
    override func initByDictionary(dictionary: [String : Any]) {
        self.userId = dictionary["userId"] as? Int ?? 0
        self.id = dictionary["id"] as? Int ?? 0
        self.title = dictionary["title"] as? String ?? ""
    }
    
}
