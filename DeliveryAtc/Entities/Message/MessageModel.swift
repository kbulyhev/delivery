//
//  MessageModel.swift
//  DeliveryAtc
//
//  Created by Kirill Bulychev on 13/09/2019.
//  Copyright © 2019 Kirill Bulychev. All rights reserved.
//
import Foundation

class MessageModel: Codable {
    var name: String
    var message: String?
    var messageType: MessageType
    
    init(name: String, message: String?, messageType: MessageType) {
        self.name = name
        self.message = message
        self.messageType = messageType
    }
}

enum MessageType: String, Codable {
    case greeting = "greeting"
    case chat = "chat"
    case leaving = "leaving"
}
