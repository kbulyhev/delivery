//
//  ChatRoomRouter.swift
//  DeliveryAtc
//
//  Created by Kirill Bulychev on 10/09/2019.
//  Copyright © 2019 Kirill Bulychev. All rights reserved.
//

import UIKit

class ChatRoomRouter: ChatRoomRouterProtocol {
    
    static func createChatRoomModule(nickname: String) -> UIViewController {
        let chatRoomVC = ChatRoomViewController()
        let presenter = ChatRoomPresenter()
        let router = ChatRoomRouter()
        let interactor = ChatRoomInteractor()
        
        chatRoomVC.presenter = presenter
        chatRoomVC.username = nickname
        
        presenter.view = chatRoomVC
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        
        return chatRoomVC
    }
}
