//
//  ChatRoomTableView.swift
//  DeliveryAtc
//
//  Created by Kirill Bulychev on 15/09/2019.
//  Copyright © 2019 Kirill Bulychev. All rights reserved.
//

import UIKit

extension ChatRoomViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let messageTableCell = MessageTableViewCell(style: .default, reuseIdentifier: "MessageCell")
        messageTableCell.selectionStyle = .none
        
        let message = messages[indexPath.row]
        messageTableCell.apply(username: self.username, message: message)
        
        return messageTableCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let height = MessageTableViewCell.height(for: messages[indexPath.row], username: username)
        return height
    }
    
    func insertNewMessageCell(_ message: MessageModel) {
        print(message.message)
        messages.append(message)
        let indexPath = IndexPath(row: messages.count - 1, section: 0)
        tableView.beginUpdates()
        tableView.insertRows(at: [indexPath], with: .bottom)
        tableView.endUpdates()
        tableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
    }
}
