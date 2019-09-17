//
//  AbstractApiService.swift
//  DeliveryAtc
//
//  Created by Kirill Bulychev on 09/09/2019.
//  Copyright © 2019 Kirill Bulychev. All rights reserved.
//

import Foundation
import AFNetworking
import os

class AbstractApiService {
    
    func loadGetData<T: AbstractModel>(url: String, modelType: T.Type, callback: @escaping ([T]?, Error?) -> Swift.Void) {
        let manager = AFHTTPSessionManager()
        
        os_log("Request ...", log: OSLog.default, type: .info)
        manager.get(
            url,
            parameters: nil,
            progress: nil,
            success: {(operation, responseObject) in
                
                guard let jsonArray = responseObject as? [[String: Any]] else {
                    return
                }
                
                callback(self.jsonToModel(jsonArray: jsonArray, instance: modelType), nil)
        },
            failure: {(operation, error) in
                os_log("Ошибка выполнения запроса", log: OSLog.default, type: .info)
                callback(nil, error)
        })
    }
    
    private func jsonToModel<T: AbstractModel>(jsonArray: [[String: Any]], instance: T.Type) -> [T] {
        var albumModels = [T]()
        
        for item in jsonArray {
            let sad = instance.init()
            sad.initByDictionary(dictionary: item)
            albumModels.append(sad)
        }
        
        return albumModels
    }
    
}
