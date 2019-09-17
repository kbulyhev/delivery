//
//  ResponseError.swift
//  DeliveryAtc
//
//  Created by Kirill Bulychev on 08/09/2019.
//  Copyright © 2019 Kirill Bulychev. All rights reserved.
//

import Foundation

struct ResponseError: Error {
    let description : String
    var localizedDesc: String {
        return NSLocalizedString(description, comment: "")
    }
}
