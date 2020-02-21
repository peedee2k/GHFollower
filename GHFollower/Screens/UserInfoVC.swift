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
    let headerView      = UIView()
    let itemViewOne     = UIView()
    let itemViewTwo     = UIView()
    var iteamsViews: [UIView] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        getUserInfo()
        layOutUI()
        

    }
    
    func configureViewController() {
            view.backgroundColor = .systemBackground
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismisVC))
            navigationItem.rightBarButtonItem = doneButton
    }
    
    func getUserInfo() {
            NetworkManager.shared.getUser(for: username) { [weak self] result in
                guard let self = self else { return }
                switch result {
                case .success(let user):
                    DispatchQueue.main.async {
                        self.add(chileVC: GFUserInfoHeaderVC(user: user), to: self.headerView)
                    }
                    case .failure(let error):
                    self.presentGFAlertOnMainThread(alertTitle: "Bad Bad", message: error.rawValue, buttonTitle: "OK")
                    }
            }
    }
    
    func layOutUI() {
        let padding: CGFloat    = 20
        let itemHeight: CGFloat = 140
            iteamsViews = [headerView, itemViewOne, itemViewTwo]
        
        for itemView in iteamsViews {
            view.addSubview(itemView)
            itemView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                itemView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
                itemView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding)
                    ])
            }
        
            itemViewOne.backgroundColor = .systemPink
            itemViewTwo.backgroundColor = .systemBlue
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 200),
            
            itemViewOne.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: padding),
            itemViewOne.heightAnchor.constraint(equalToConstant: itemHeight),
            
            itemViewTwo.topAnchor.constraint(equalTo: itemViewOne.bottomAnchor, constant: padding),
            itemViewTwo.heightAnchor.constraint(equalToConstant: itemHeight)
                ])
    }
        
    
    @objc func dismisVC() {
        dismiss(animated: true)
    }
    func add(chileVC: UIViewController, to containerView: UIView) {
                addChild(chileVC)
                containerView.addSubview(chileVC.view)
                containerView.frame = chileVC.view.bounds
                chileVC.didMove(toParent: self)
        
    }
    
    
}
