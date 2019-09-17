//
//  ChatRoomPresenter.swift
//  DeliveryAtc
//
//  Created by Kirill Bulychev on 10/09/2019.
//  Copyright © 2019 Kirill Bulychev. All rights reserved.
//

import UIKit

class ChatRoomPresenter: ChatRoomPresenterProtocol {
    
    weak var view: ChatRoomViewControllerProtocol!
    var router: ChatRoomRouterProtocol!
    var interactor: ChatRoomInteractorProtocol!
    
    func setupCommunication(username:String) {
        interactor.setupCommunication(username: username)
    }
    
    func disconnectFromWs() {
        interactor.disconnectFromWs()
    }
    
    func showErrorMessage(message: String) {
        view.showErrorMessage(message: message)
    }
    
    func insertMessageCell(message: MessageModel) {
        view.insertNewMessageCell(message)
    }
    
    func sendMessage(message: String, username: String) {
        interactor.sendMessage(message: message, username: username)
    }
}
