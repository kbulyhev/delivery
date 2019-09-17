//
//  MessageItemsRouter.swift
//  DeliveryAtc
//
//  Created by Kirill Bulychev on 07/09/2019.
//  Copyright © 2019 Kirill Bulychev. All rights reserved.
//

import UIKit

class MessageItemsRouter: MessageItemRouterProtocol {
    
    static var storyboard: UIStoryboard {
        return UIStoryboard(name: "Message", bundle: nil)
    }
    
    static func createMessageItemModule() -> UIViewController {
        
        let messageVC = MessageItemViewController()
        let messagePresenter = MessageItemPresenter(view: messageVC)
        messagePresenter.router = MessageItemsRouter()
        messagePresenter.interactor = MessageInteractor()
        
        messageVC.presenter = messagePresenter
        return messageVC
    }
   
    func goToChatRoom(fromView: UIViewController, username: String) {
        let chatRoomVc = ChatRoomRouter.createChatRoomModule(nickname: username)
        
        let tabBarViewController = fromView.parent?.parent
        
        if let ss = tabBarViewController as? TabBarViewController {
            ss.tabBar.isHidden = true
        }
        
        fromView.navigationController?.pushViewController(chatRoomVc, animated: false)
    }
    
}
