//
//  MessageInputBar.swift
//  DeliveryAtc
//
//  Created by Kirill Bulychev on 15/09/2019.
//  Copyright © 2019 Kirill Bulychev. All rights reserved.
//

import UIKit

protocol MessageInputDelegate: class {
    func sendMessage(message: String)
}

class MessageInputBar: UIView {
    var delegate: MessageInputDelegate?
    let textView = UITextView()
    let sendButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(red: 247 / 255, green: 247 / 255, blue: 247 / 255, alpha: 1.0)
        textView.layer.cornerRadius = 4
        textView.layer.borderColor = UIColor(red: 200 / 255, green: 200 / 255, blue: 200 / 255, alpha: 0.6).cgColor
        textView.layer.borderWidth = 1
        textView.text = "Placeholder"
        textView.textColor = UIColor.lightGray
        
//        sendButton.backgroundColor = UIColor(red: 8 / 255, green: 183 / 255, blue: 231 / 255, alpha: 1.0)
        sendButton.layer.cornerRadius = 4
        sendButton.isEnabled = true
//        sendButton.setTitle("wdwad", for: .normal)
        sendButton.setImage(UIImage(named: "send-button"), for: .normal)
        
        sendButton.addTarget(self, action: #selector(MessageInputBar.sendMessage), for: .touchUpInside)
        
        addSubview(textView)
        addSubview(sendButton)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func sendMessage() {
        if let delegate = delegate, let message = textView.text {
            delegate.sendMessage(message:  message)
            textView.text = ""
        }
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Placeholder"
            textView.textColor = UIColor.lightGray
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            sendButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -5),
            sendButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            sendButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            
            textView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            textView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.8),
            
            textView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            textView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
        ])
    }
}
