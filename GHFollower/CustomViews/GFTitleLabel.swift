//
//  GFTitleLabel.swift
//  GHFollower
//
//  Created by Pankaj Sharma on 1/18/20.
//  Copyright © 2020 Pankaj Sharma. All rights reserved.
//

import UIKit

class GFTitleLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configur()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(textAlignment: NSTextAlignment, fontSize: CGFloat) {
        super.init(frame: .zero)
        self.textAlignment = textAlignment
        self.font = UIFont.systemFont(ofSize: fontSize, weight: .bold)
        configur()
    }
    private func configur() {
        translatesAutoresizingMaskIntoConstraints = false
        textColor                   = .label
        minimumScaleFactor          = 0.9
        adjustsFontSizeToFitWidth   = true
        lineBreakMode               = .byTruncatingTail
    }
    
}
