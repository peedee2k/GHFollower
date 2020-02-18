//
//  UserInfoVC.swift
//  GHFollower
//
//  Created by Pankaj Sharma on 2/16/20.
//  Copyright © 2020 Pankaj Sharma. All rights reserved.
//

import UIKit

class UserInfoVC: UIViewController {
    
    var username: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismisVC))
        navigationItem.rightBarButtonItem = doneButton
       print(username!)
        NetworkManager.shared.getUser(for: username) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let user):
                print(user)
            case .failure(let error):
                self.presentGFAlertOnMainThread(alertTitle: "Bad Bad", message: error.rawValue, buttonTitle: "OK")
                
            }
        }

    }
    
    @objc func dismisVC() {
        dismiss(animated: true)
    }

    
}
