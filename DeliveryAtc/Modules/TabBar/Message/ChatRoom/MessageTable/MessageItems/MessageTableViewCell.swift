//
//  MessageTableViewCell.swift
//  DeliveryAtc
//
//  Created by Kirill Bulychev on 15/09/2019.
//  Copyright © 2019 Kirill Bulychev. All rights reserved.
//

import UIKit

enum MessageSender {
    case ourself
    case someoneElse
}

class MessageTableViewCell: UITableViewCell {
    var messageSender: MessageSender = .ourself
    var messageType: MessageType = .chat
    
    let messageLabel = UILabel()
    let nameLabel = UILabel()
    
    func apply(username: String, message: MessageModel) {
        nameLabel.text = message.name
        messageLabel.text = message.message
        
        let asd = username 
        print(asd)
        if message.name == username {
            messageSender = .ourself
        } else {
            messageSender = .someoneElse
        }
        messageType = message.messageType
        
        setNeedsLayout()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        messageLabel.clipsToBounds = true
        messageLabel.textColor = .white
        messageLabel.numberOfLines = 0
        
        nameLabel.textColor = .lightGray
        nameLabel.font = UIFont(name: "Helvetica", size: 10)
        
        clipsToBounds = true
        
        addSubview(messageLabel)
        addSubview(nameLabel)
    }
    
    static func height(for message: MessageModel, username: String) -> CGFloat {
        let maxSize = CGSize(width: 2*(UIScreen.main.bounds.size.width/3), height: CGFloat.greatestFiniteMagnitude)
    
        
        let nameHeight = message.name == username ? 0 : (height(forText: message.name, fontSize: 10, maxSize: maxSize) + 4 )
        let messageHeight = height(forText: message.message!, fontSize: 17, maxSize: maxSize)
        
        return nameHeight + messageHeight + 32 + 16
    }
    
    private class func height(forText text: String, fontSize: CGFloat, maxSize: CGSize) -> CGFloat {
        let font = UIFont(name: "Helvetica", size: fontSize)!
        let attrString = NSAttributedString(string: text, attributes:[NSAttributedString.Key.font: font,
                                                                      NSAttributedString.Key.foregroundColor: UIColor.white])
        let textHeight = attrString.boundingRect(with: maxSize, options: .usesLineFragmentOrigin, context: nil).size.height
        return textHeight
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MessageTableViewCell {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if messageType == .greeting {
            layoutForJoinMessage()
        } else {
            messageLabel.font = UIFont(name: "Helvetica", size: 17)
            messageLabel.textColor = .white
            
            let size = messageLabel.sizeThatFits(CGSize(width: 2 * (bounds.size.width / 3), height: .greatestFiniteMagnitude))
            messageLabel.frame = CGRect(x: 0, y: 0, width: size.width + 32, height: size.height + 16)
            
            if messageSender == .ourself {
                nameLabel.isHidden = true
                
                messageLabel.center = CGPoint(x: bounds.size.width - messageLabel.bounds.size.width/2.0 - 16, y: bounds.size.height/2.0)
                messageLabel.backgroundColor = UIColor(red: 24 / 255, green: 180 / 255, blue: 128 / 255, alpha: 1.0)
            } else {
                nameLabel.isHidden = false
                nameLabel.sizeToFit()
                nameLabel.center = CGPoint(x: nameLabel.bounds.size.width / 2.0 + 16 + 4, y: nameLabel.bounds.size.height/2.0 + 4)
                
                messageLabel.center = CGPoint(x: messageLabel.bounds.size.width / 2.0 + 16, y: messageLabel.bounds.size.height/2.0 + nameLabel.bounds.size.height + 8)
                messageLabel.backgroundColor = .lightGray
            }
        }
        
        messageLabel.layer.cornerRadius = min(messageLabel.bounds.size.height / 2.0, 20)
    }
    
    func layoutForJoinMessage() {
        messageLabel.font = UIFont.systemFont(ofSize: 10)
        messageLabel.textColor = .lightGray
        messageLabel.backgroundColor = UIColor(red: 247 / 255, green: 247 / 255, blue: 247 / 255, alpha: 1.0)
        
        let size = messageLabel.sizeThatFits(CGSize(width: 2 * (bounds.size.width / 3), height: .greatestFiniteMagnitude))
        messageLabel.frame = CGRect(x: 0, y: 0, width: size.width + 32, height: size.height + 16)
        messageLabel.center = CGPoint(x: bounds.size.width / 2, y: bounds.size.height / 2.0)
    }

}
