//
//  StorageService.swift
//  DeliveryAtc
//
//  Created by Kirill Bulychev on 08/09/2019.
//  Copyright © 2019 Kirill Bulychev. All rights reserved.
//

import Foundation

protocol StorageServiceProtocol: class {
    func loadArrayDataByKey<T: Codable>(key: String, type: T.Type) -> T?
    func saveDataInStorage<T: Encodable>(data: T, key: String)
    func hasStorageData(key: String) -> Bool
}

class StorageService: StorageServiceProtocol {
    
    init() {
        print("объект создался")
    }
    
    func loadArrayDataByKey<T: Codable>(key: String, type: T.Type) -> T? {
        if let data = UserDefaults.standard.object(forKey: key) as? Data {
            let arrayData = try? PropertyListDecoder().decode(type, from: data)
            
            return arrayData!
        }
        
        return nil
    }
    
    func saveDataInStorage<T: Encodable>(data: T, key: String) {
        UserDefaults.standard.set(try? PropertyListEncoder().encode(data), forKey: key)
        UserDefaults.standard.synchronize()
    }
    
    func hasStorageData(key: String) -> Bool {
        if UserDefaults.standard.value(forKeyPath: key) != nil {
            return true
        } else {
            return false
        }
    }
}
