//
//  GFButton.swift
//  GHFollower
//
//  Created by Pankaj Sharma on 1/14/20.
//  Copyright © 2020 Pankaj Sharma. All rights reserved.
//

import UIKit

class GFButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configur()
        
    }
    
    init(backgroundColor: UIColor, title: String) {
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        self.setTitle(title, for: .normal)
        configur()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configur() {
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius      = 10
        titleLabel?.textColor   = .white
        titleLabel?.font        = UIFont.preferredFont(forTextStyle: .title1)
        
    }
    
}
