//
//  UIViewController+Ext.swift
//  GHFollower
//
//  Created by Pankaj Sharma on 1/21/20.
//  Copyright © 2020 Pankaj Sharma. All rights reserved.
//

import UIKit

extension UIViewController {
    func presentGFAlertOnMainThread(alertTitle:String, message:String, buttonTitle: String) {
        DispatchQueue.main.async {
            let alertVC = GFAlertVC(alertTitle: alertTitle, message: message, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            self.present(alertVC, animated: true)
            }
        }
    }
