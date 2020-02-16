//
//  UIHelper.swift
//  GHFollower
//
//  Created by Pankaj Sharma on 2/12/20.
//  Copyright © 2020 Pankaj Sharma. All rights reserved.
//

import UIKit

class UIHelper {
        static func createThreeColoumFlowLayout(in view: UIView) -> UICollectionViewFlowLayout {
    
        let width                   = view.bounds.width
        let padding: CGFloat        = 12
        let minimumPadding: CGFloat = 10
        let availableWidth          = width - (padding * 2) - (minimumPadding * 2)
        let itemWidth               = availableWidth / 3
    
    
        let flowLayout              = UICollectionViewFlowLayout()
        flowLayout.sectionInset     = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize         = CGSize(width: itemWidth, height: itemWidth + 40)

        return flowLayout
        }
}
