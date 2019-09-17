//
//  TabBarRouter.swift
//  DeliveryAtc
//
//  Created by Kirill Bulychev on 07/09/2019.
//  Copyright © 2019 Kirill Bulychev. All rights reserved.
//

import UIKit

class TabBarRouter: TabBarRouterProtocol {
    
    private static var identifier = "TabBarViewController"
    
    static func createNavigationModule() -> TabBarViewController {
        let tabss = TabBarItemsBuilder.build()
        let tabBarVC = TabBarViewController(tabs: tabss)
        return tabBarVC
    }
    
}
