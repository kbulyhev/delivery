//
//  StringExtension.swift
//  DeliveryAtc
//
//  Created by Kirill Bulychev on 15/09/2019.
//  Copyright © 2019 Kirill Bulychev. All rights reserved.
//

import Foundation

extension String {
    func withoutWhitespace() -> String {
        return self.replacingOccurrences(of: "\n", with: "")
            .replacingOccurrences(of: "\r", with: "")
            .replacingOccurrences(of: "\0", with: "")
    }
}
