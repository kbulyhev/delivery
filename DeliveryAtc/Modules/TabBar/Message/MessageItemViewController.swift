//
//  MessageItemViewController.swift
//  DeliveryAtc
//
//  Created by Kirill Bulychev on 07/09/2019.
//  Copyright © 2019 Kirill Bulychev. All rights reserved.
//

import UIKit

class MessageItemViewController: UIViewController, UITextFieldDelegate, MessageItemViewProtocol {
    
    var presenter: MessageItemPresenterProtocol!
    let logoImageView = UIImageView()
    let nameTextField = JoinTextField()
    let joinButton = UIButton()
    let shadowView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        
        self.view.addSubview(logoImageView)
        self.view.addSubview(nameTextField)
        self.view.addSubview(joinButton)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
         let tabBarViewController = self.parent?.parent
        
        if let ss = tabBarViewController as? TabBarViewController {
            ss.tabBar.isHidden = false
        }
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //        let chatRoomVC = ChatRoomViewController()
        //        if let username = nameTextField.text {
        //            print(username)
        ////            chatRoomVC.username = username
        //        }
        //        navigationController?.pushViewController(chatRoomVC, animated: true)
        return true
    }
    
    func initView(){
        view.backgroundColor = UIColor(red: 24/255, green: 180/255, blue: 128/255, alpha: 1.0)
        navigationItem.title = "AAA"
        
        joinButton.backgroundColor = UIColor.white
        joinButton.setTitle("Присоединиться", for: .normal)
        joinButton.setTitleColor(UIColor.black, for: .normal)
        joinButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        joinButton.tag = 1
        
        logoImageView.image = UIImage(named: "icons8-home-50")
        logoImageView.layer.cornerRadius = 4
        logoImageView.clipsToBounds = true
        
        shadowView.layer.shadowColor = UIColor.black.cgColor
        shadowView.layer.shadowRadius = 5
        shadowView.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        shadowView.layer.shadowOpacity = 0.5
        shadowView.backgroundColor = UIColor(red: 24 / 255, green: 180 / 255, blue: 128 / 255, alpha: 1.0)
        
        nameTextField.placeholder = "Введите имя"
        nameTextField.backgroundColor = .white
        nameTextField.layer.cornerRadius = 10
        
        let backItem = UIBarButtonItem()
        backItem.title = "Назад"
        navigationItem.backBarButtonItem = backItem
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        logoImageView.bounds = CGRect(x: 0, y: 0, width: 150, height: 150)
        logoImageView.center = CGPoint(x: view.bounds.size.width / 2.0, y: logoImageView.bounds.size.height / 2.0 + view.bounds.size.height/5)
        shadowView.frame = logoImageView.frame
        //
        nameTextField.bounds = CGRect(x: 0, y: 0, width: view.bounds.size.width - 40, height: 44)
        nameTextField.center = CGPoint(x: view.bounds.size.width / 2.0, y: logoImageView.center.y + logoImageView.bounds.size.height / 2.0 + 20 + 22)
        
        joinButton.bounds = CGRect(x: 0, y: 0, width: 100, height: 50)
        joinButton.center = CGPoint(x: view.bounds.size.width / 2.0, y: logoImageView.center.y + logoImageView.bounds.size.height / 2.0 + 20 + 22 + 100)
    }
    
    @objc func buttonAction(sender: UIButton!) {
        presenter.goToChatRoom(fromView: self, username: nameTextField.text!)
        print("asd")
    }
    
    
}
