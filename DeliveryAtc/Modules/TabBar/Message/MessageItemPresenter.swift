//
//  MessageItemPresenter.swift
//  DeliveryAtc
//
//  Created by Kirill Bulychev on 07/09/2019.
//  Copyright © 2019 Kirill Bulychev. All rights reserved.
//

import UIKit

class MessageItemPresenter: MessageItemPresenterProtocol {
    
    weak var view: MessageItemViewProtocol!
    var router: MessageItemRouterProtocol!
    var interactor: MessageItemInteractorProtocol!
    
    init(view: MessageItemViewProtocol) {
        self.view = view
    }
    
    func goToChatRoom(fromView: UIViewController, username: String) {
        router.goToChatRoom(fromView: fromView, username: username)
    }
}
