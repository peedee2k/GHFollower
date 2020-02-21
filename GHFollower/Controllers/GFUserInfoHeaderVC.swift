//
//  GFUserInfoHeaderVC.swift
//  GHFollower
//
//  Created by Pankaj Sharma on 2/19/20.
//  Copyright © 2020 Pankaj Sharma. All rights reserved.
//

import UIKit

class GFUserInfoHeaderVC: UIViewController {
    
    let avatarImageView = GFAvatarImageView(frame: .zero)
    let userNameLabel   = GFTitleLabel(textAlignment: .left, fontSize: 34)
    let nameLabel       = GFSeconderyLabel(fontSize: 18)
    let locationImage   = UIImageView()
    let locationLabel   = GFSeconderyLabel(fontSize: 18)
    let bioLabel        = GFBodyLabel(textAlignment: .left)
    
    var user: User!
    
    init(user: User) {
        super.init(nibName: nil, bundle: nil)
        self.user = user
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        layOutUI()
        configureUIElements()
    }
    
    func configureUIElements() {
        avatarImageView.downloadImage(from: user.avatarUrl)
        userNameLabel.text      = user.login
        nameLabel.text          = user.name ?? ""
        locationImage.image     = UIImage(systemName: SFSymbole.location)
        locationImage.tintColor = .secondaryLabel
        locationLabel.text      = user.location ?? "N/A"
        bioLabel.text           = user.bio ?? ""
        bioLabel.numberOfLines  = 3
        
    }
    
     func addSubViews() {
        view.addSubview(avatarImageView)
        view.addSubview(userNameLabel)
        view.addSubview(nameLabel)
        view.addSubview(locationImage)
        view.addSubview(locationLabel)
        view.addSubview(bioLabel)
        
    }
    
    func layOutUI() {
        
        let padding: CGFloat            = 20
        let textImagePadding: CGFloat   = 12
        locationImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
            avatarImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            avatarImageView.heightAnchor.constraint(equalToConstant: 90),
            avatarImageView.widthAnchor.constraint(equalToConstant: 90),
            
            userNameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
            userNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: textImagePadding),
            userNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            userNameLabel.heightAnchor.constraint(equalToConstant: 38),
            
            nameLabel.leadingAnchor.constraint(equalTo: userNameLabel.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: userNameLabel.trailingAnchor),
            nameLabel.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor, constant: 8),
            nameLabel.heightAnchor.constraint(equalToConstant: 20),
            
            
            locationImage.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: textImagePadding),
            locationImage.bottomAnchor.constraint(equalTo: avatarImageView.bottomAnchor),
            locationImage.heightAnchor.constraint(equalToConstant: 20),
            locationImage.widthAnchor.constraint(equalToConstant: 20),
            
            locationLabel.centerYAnchor.constraint(equalTo: locationImage.centerYAnchor),
            locationLabel.leadingAnchor.constraint(equalTo: locationImage.trailingAnchor, constant: 5),
            locationLabel.trailingAnchor.constraint(equalTo: nameLabel.trailingAnchor),
            locationLabel.heightAnchor.constraint(equalToConstant: 20),
            
            bioLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: textImagePadding),
            bioLabel.leadingAnchor.constraint(equalTo: avatarImageView.leadingAnchor),
            bioLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            bioLabel.heightAnchor.constraint(equalToConstant: 60)
                ])
    }
    

}
