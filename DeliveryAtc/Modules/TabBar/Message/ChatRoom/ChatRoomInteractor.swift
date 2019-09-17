//
//  ChatRoomInteractor.swift
//  DeliveryAtc
//
//  Created by Kirill Bulychev on 10/09/2019.
//  Copyright © 2019 Kirill Bulychev. All rights reserved.
//

import UIKit
import SocketIO
import Starscream

class ChatRoomInteractor: ChatRoomInteractorProtocol {
    
    weak var presenter: ChatRoomPresenterProtocol!
    var socketService = SocketService()
    
    func disconnectFromWs() {
        socketService.onDisconnect()
    }
    
    func setupCommunication(username: String) {
        let messageModel = MessageModel(name: username, message: "User \(username) has joined to the chat",
            messageType: .greeting)
        
        socketService.onConnect(messageModel: messageModel, callbackError: {(error) in
            self.presenter.showErrorMessage(message: "Ошибка в процессе формирования данных")
        }, callbackMessage: {(message) in
            self.presenter.insertMessageCell(message: message)
        })
        
    }
    
    func sendMessage(message: String, username: String) {
        let messageModel = MessageModel(name: username, message: message, messageType: .chat)
        socketService.sendMessage(messageModel: messageModel)
    }
}
