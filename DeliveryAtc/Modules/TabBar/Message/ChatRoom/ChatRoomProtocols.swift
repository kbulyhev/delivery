//
//  ChatRoomProtocols.swift
//  DeliveryAtc
//
//  Created by Kirill Bulychev on 10/09/2019.
//  Copyright © 2019 Kirill Bulychev. All rights reserved.
//

import UIKit

protocol ChatRoomViewControllerProtocol: class {
    func showErrorMessage(message: String)
    func insertNewMessageCell(_ message: MessageModel)
}

protocol ChatRoomPresenterProtocol: class {
    func setupCommunication(username: String)
    func disconnectFromWs()
    func showErrorMessage(message: String)
    func insertMessageCell(message: MessageModel)
    func sendMessage(message: String, username: String)
}

protocol ChatRoomRouterProtocol: class {
    static func createChatRoomModule(nickname: String) -> UIViewController
}

protocol ChatRoomInteractorProtocol: class {
    func setupCommunication(username: String)
    func disconnectFromWs()
    func sendMessage(message: String, username: String)
}
