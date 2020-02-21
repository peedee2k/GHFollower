//
//  GFSeconderyLabel.swift
//  GHFollower
//
//  Created by Pankaj Sharma on 2/19/20.
//  Copyright © 2020 Pankaj Sharma. All rights reserved.
//

import UIKit

class GFSeconderyLabel: UILabel {

    override init(frame: CGRect) {
          super.init(frame: frame)
          configur()
      }
      
      required init?(coder: NSCoder) {
          fatalError("init(coder:) has not been implemented")
      }
      
      init(fontSize: CGFloat) {
          super.init(frame: .zero)
          font = UIFont.systemFont(ofSize: fontSize, weight: .medium)
          configur()
      }
      private func configur() {
          translatesAutoresizingMaskIntoConstraints = false
          textColor                   = .secondaryLabel
          minimumScaleFactor          = 0.9
          adjustsFontSizeToFitWidth   = true
          lineBreakMode               = .byTruncatingTail
      }

}
