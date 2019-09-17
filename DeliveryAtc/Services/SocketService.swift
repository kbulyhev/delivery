//
//  SocketService.swift
//  DeliveryAtc
//
//  Created by Kirill Bulychev on 13/09/2019.
//  Copyright © 2019 Kirill Bulychev. All rights reserved.
//

import Foundation
import Starscream
import os

protocol SocketServiceProtocol: class {
    func onConnect(messageModel: MessageModel, callbackError: (Error?) -> Swift.Void, callbackMessage: @escaping(MessageModel) -> Swift.Void)
    func onDisconnect()
    func sendMessage(messageModel: MessageModel)
    func subscribe(callbackMessage: @escaping (MessageModel) -> Swift.Void)
}

class SocketService: SocketServiceProtocol {
    
    private static let connectionUrl = "ws://localhost:8080/myHandler"
    
    let socket = WebSocket(url: URL(string: connectionUrl)!)
    
    func onConnect(messageModel: MessageModel, callbackError: (Error?) -> Swift.Void,
                    callbackMessage: @escaping (MessageModel) -> Swift.Void) {
        let jsonEncoder = JSONEncoder()
        
        do {
            let jsonData = try jsonEncoder.encode(messageModel)
            let json = String(data: jsonData, encoding: String.Encoding.utf8)
            socket.onConnect = {
                self.socket.write(string: json!)
                
                os_log("Socket connected to host ", log: OSLog.default, type: .info)
            }
            
        } catch let error {
            print("123")
            callbackError(error)
        }
        
//        onDisconnect()
        
        subscribe(callbackMessage: callbackMessage)
        
        socket.connect()
        
    }
    
    func onDisconnect() {
        socket.onDisconnect = { (error) in
            os_log("Socket disconnected from host ", log: OSLog.default, type: .info)
        }
        
        socket.disconnect()
    }
    
    func sendMessage(messageModel: MessageModel) {
        let jsonEncoder = JSONEncoder()
        
        do {
        let jsonData = try jsonEncoder.encode(messageModel)
        let json = String(data: jsonData, encoding: String.Encoding.utf8)
        socket.write(string: json!)
            
        } catch let error {
            print("123")
//            callbackError(error)
        }
    }
    
    func subscribe(callbackMessage: @escaping (MessageModel) -> Swift.Void) {
        socket.onText = { (text: String) in
            
            print(text)
            do {
                let dataJson = text.data(using: .utf8)
                if dataJson != nil {
                    let message = try JSONDecoder().decode(MessageModel.self, from: dataJson!) as MessageModel
                    print(text)
                    callbackMessage(message)
                }
                
            } catch let error {
                print(error.localizedDescription)
            }
        }
    }
    
}
