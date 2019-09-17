//
//  MessageLabel.swift
//  DeliveryAtc
//
//  Created by Kirill Bulychev on 16/09/2019.
//  Copyright © 2019 Kirill Bulychev. All rights reserved.
//

import UIKit

class Label: UILabel {
      override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets.init(top: 8, left: 16, bottom: 8, right: 16)
        super.drawText(in: rect.inset(by: insets))
      }
}
