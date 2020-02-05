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
         
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setToolbarHidden(false, animated: true)
    }

    

}
