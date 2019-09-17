//
//  MessageItemProtocols.swift
//  DeliveryAtc
//
//  Created by Kirill Bulychev on 07/09/2019.
//  Copyright © 2019 Kirill Bulychev. All rights reserved.
//

import UIKit

protocol MessageItemViewProtocol: class {
    
}

protocol MessageItemPresenterProtocol: class {
    func goToChatRoom(fromView: UIViewController, username: String)
}

protocol MessageItemRouterProtocol: class {
    static func createMessageItemModule() -> UIViewController
    func goToChatRoom(fromView: UIViewController, username: String)
}

protocol MessageItemInteractorProtocol: class {
}
