//
//  FollowerListVC.swift
//  GHFollower
//
//  Created by Pankaj Sharma on 1/15/20.
//  Copyright © 2020 Pankaj Sharma. All rights reserved.
//

import UIKit

class FollowerListVC: UIViewController {
    
    var userName: String!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
     
            NetworkManager.shared.getFollower(for: userName, page: 1) { result in
                
            
            switch result {
            case .success(let followers):
                print(followers)
            case .failure(let error):
                self.presentGFAlertOnMainThread(alertTitle: "Bad things happend", message: error.rawValue, buttonTitle: "Ok")
                
            }
            
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setToolbarHidden(false, animated: true)
    }

    

}
