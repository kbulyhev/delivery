//
//  TabBarItemsBuilder.swift
//  DeliveryAtc
//
//  Created by Kirill Bulychev on 07/09/2019.
//  Copyright © 2019 Kirill Bulychev. All rights reserved.
//

import UIKit

struct TabBarItems {
    var home: UIViewController
    var message: UIViewController
    
    init(home: UIViewController, message: UIViewController) {
        self.home = home
        self.message = message
    }
    
    func toArray() -> [UIViewController] {
        return [home, message]
    }
}

class TabBarItemsBuilder {
    
    static func build() -> TabBarItems {
        let home = HomeItemRouter.createHomeItemModule()
        let message = UINavigationController(rootViewController: MessageItemsRouter.createMessageItemModule())
        
        home.tabBarItem = UITabBarItem(title: "Домой", image: UIImage(named: "icons8-home-30"), tag: 11)
        message.tabBarItem = UITabBarItem(title: "Сообщения", image: UIImage(named: "icons8-new-message-30"), tag: 11)
        
        return TabBarItems(home: home, message: message)
    }
}
