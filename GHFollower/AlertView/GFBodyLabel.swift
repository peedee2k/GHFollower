//
//  GFBodyLabel.swift
//  GHFollower
//
//  Created by Pankaj Sharma on 1/18/20.
//  Copyright © 2020 Pankaj Sharma. All rights reserved.
//

import UIKit

class GFBodyLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(textAlignment: NSTextAlignment) {
        super.init(frame: .zero)
        self.textAlignment = textAlignment
        configur()
    }
    
    private func configur() {
        translatesAutoresizingMaskIntoConstraints = false
        font                        = UIFont.preferredFont(forTextStyle: .body)
        textColor                   = .secondaryLabel
        lineBreakMode               = .byWordWrapping
        minimumScaleFactor          = 0.75
        adjustsFontSizeToFitWidth   = true
        
    }
    
}
