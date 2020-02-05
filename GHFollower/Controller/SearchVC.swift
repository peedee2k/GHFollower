//
//  SearchVC.swift
//  GHFollower
//
//  Created by Pankaj Sharma on 1/14/20.
//  Copyright © 2020 Pankaj Sharma. All rights reserved.
//

import UIKit

class SearchVC: UIViewController {
    
    let logoImageView       = UIImageView()
    let usernameTextField   = GFTextField()
    let getFollowerButton   = GFButton(backgroundColor: .systemGreen, title: "Get Follower")
    
    var isUserNameEnterd: Bool {
        return !usernameTextField.text!.isEmpty
    }
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        addTapGesterRecognizer()
        configureLogoImageView()
        configureUsernameTextField()
        configureGetFollowerButton()
        }
    
    
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
        navigationController?.setToolbarHidden(true, animated: true)
       }
    
    
    // Dismis Keyboard
    
    func addTapGesterRecognizer() {
        let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismisKeyboard))
            view.addGestureRecognizer(tap)
    }
    @objc func dismisKeyboard() {
                view.endEditing(true)
                }
    
    @objc func pushFollowerListVC() {
        
        guard isUserNameEnterd else {
            presentGFAlertOnMainThread(alertTitle: "Empty username", message: "Please enter username 🙂", buttonTitle: "Ok")
            return
        }
        let followerListVC          = FollowerListVC()
            followerListVC.userName = usernameTextField.text
            followerListVC.title    = usernameTextField.text
            navigationController?.pushViewController(followerListVC, animated: true)
            usernameTextField.text = ""
        
    }
   
    
    func  configureLogoImageView() {
            view.addSubview(logoImageView)
            logoImageView.translatesAutoresizingMaskIntoConstraints = false
            logoImageView.image = UIImage(named: "gh-logo")
        
            NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 200),
            logoImageView.widthAnchor.constraint(equalToConstant: 200)
            ])
        }
    
    func configureUsernameTextField() {
            view.addSubview(usernameTextField)
        usernameTextField.delegate = self
            NSLayoutConstraint.activate([
            usernameTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 50),
            usernameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            usernameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            usernameTextField.heightAnchor.constraint(equalToConstant: 50)
            ])
        }
    
    func configureGetFollowerButton() {
            view.addSubview(getFollowerButton)
            getFollowerButton.addTarget(self, action: #selector(pushFollowerListVC), for: .touchUpInside)
        
            NSLayoutConstraint.activate([
            getFollowerButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -75),
            getFollowerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            getFollowerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            getFollowerButton.heightAnchor.constraint(equalToConstant: 50)
            ])
    }
    

}

extension SearchVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            pushFollowerListVC()
            return true
    }
    
}
