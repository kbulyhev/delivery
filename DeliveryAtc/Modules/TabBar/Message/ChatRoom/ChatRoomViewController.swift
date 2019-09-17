//
//  ChatRoomViewController.swift
//  DeliveryAtc
//
//  Created by Kirill Bulychev on 10/09/2019.
//  Copyright © 2019 Kirill Bulychev. All rights reserved.
//

import UIKit
import Starscream

class ChatRoomViewController: UIViewController, ChatRoomViewControllerProtocol, MessageInputDelegate {
    let tableView = UITableView()
    let messageInputBar = MessageInputBar()
    var presenter: ChatRoomPresenterProtocol!
    var username: String = "username"
    var messages: [MessageModel] = []
    
    
    deinit {
        presenter.disconnectFromWs()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter.setupCommunication(username: username)
    }
    
    func showErrorMessage(message: String) {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: "", message: message, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction) in
                
            })
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    func sendMessage(message: String) {
        presenter.sendMessage(message: message, username: username)
    }
}

extension ChatRoomViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        
         loadViews()
    }
    
    @objc func keyboardWillChange(notification: NSNotification) {
        if let userInfo = notification.userInfo {
            let endFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)!.cgRectValue
            let messageBarHeight = messageInputBar.bounds.size.height
            let point = CGPoint(x: messageInputBar.center.x, y: endFrame.origin.y - messageBarHeight/2.0)
            let inset = UIEdgeInsets(top: 0, left: 0, bottom: endFrame.size.height, right: 0)
            UIView.animate(withDuration: 0.25) {
                self.messageInputBar.center = point
                self.tableView.contentInset = inset
            }
        }
    }
    
    func loadViews() {
        navigationItem.title = "ДА НАЧНЕСТЯ СРАЧ"
//        navigationItem.titleView = UIImageView(image: UIImage(named: "logo"))
        
        view.backgroundColor = UIColor(red: 24 / 255, green: 180 / 255, blue: 128 / 255, alpha: 1.0)
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = .white
        
        view.addSubview(tableView)
        view.addSubview(messageInputBar)
        
        messageInputBar.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        messageInputBar.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            messageInputBar.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            messageInputBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            messageInputBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            messageInputBar.heightAnchor.constraint(equalToConstant: 60),
            
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: messageInputBar.topAnchor)
//            tableView.heightAnchor.constraint(equalTo: messageInputBar.heightAnchor, constant: 30)
        ])
    }
}
