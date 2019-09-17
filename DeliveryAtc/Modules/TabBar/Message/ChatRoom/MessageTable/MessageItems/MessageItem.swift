//
//  MessageItem.swift
//  DeliveryAtc
//
//  Created by Kirill Bulychev on 15/09/2019.
//  Copyright © 2019 Kirill Bulychev. All rights reserved.
//

import UIKit

class MessageItem: UIView {
    var username = UILabel()
//    var avatar = UIImageView()
    var message = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        self.backgroundColor = .lightGray
        layer.masksToBounds = true
        layer.cornerRadius = 15
        
        username.text = "Username"
        username.textColor = .blue
        username.font = UIFont.systemFont(ofSize: 10)
        
//        avatar.image = UIImage(named: "user")
//        avatar.layer.cornerRadius = 20;
//        avatar.layer.borderWidth = 2.0;
//        avatar.layer.masksToBounds = true;
        
        message.textColor = .black
        message.font = UIFont.systemFont(ofSize: 15)
        message.text = "ADsadasd asd asd asd adasdasd asdas das dasd"
        
        addSubview(username)
//        addSubview(avatar)
        addSubview(message)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        username.translatesAutoresizingMaskIntoConstraints = false
        message.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            username.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            username.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            
            message.leftAnchor.constraint(equalTo: self.leftAnchor),
            message.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ])
    }
}
