//
//  TabBarViewController.swift
//  DeliveryAtc
//
//  Created by Kirill Bulychev on 07/09/2019.
//  Copyright © 2019 Kirill Bulychev. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    init(tabs: TabBarItems) {
        super.init(nibName: nil, bundle: nil)
        self.viewControllers = tabs.toArray()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
