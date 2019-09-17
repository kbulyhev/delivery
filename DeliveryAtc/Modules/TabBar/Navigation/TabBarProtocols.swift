//
//  TabBarProtocols.swift
//  DeliveryAtc
//
//  Created by Kirill Bulychev on 07/09/2019.
//  Copyright © 2019 Kirill Bulychev. All rights reserved.
//

import UIKit

protocol TabBarViewProtocol: class {
}


protocol TabBarRouterProtocol: class {
    static func createNavigationModule() -> TabBarViewController
}

