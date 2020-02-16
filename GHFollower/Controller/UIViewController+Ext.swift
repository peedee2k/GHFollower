//
//  UIViewController+Ext.swift
//  GHFollower
//
//  Created by Pankaj Sharma on 1/21/20.
//  Copyright © 2020 Pankaj Sharma. All rights reserved.
//

import UIKit

fileprivate var containerView: UIView!


extension UIViewController {
        func presentGFAlertOnMainThread(alertTitle:String, message:String, buttonTitle: String) {
                DispatchQueue.main.async {
            let alertVC = GFAlertVC(alertTitle: alertTitle, message: message, buttonTitle: buttonTitle)
                alertVC.modalPresentationStyle = .overFullScreen
                alertVC.modalTransitionStyle = .crossDissolve
            self.present(alertVC, animated: true)
            }
        }
    
    
        func showLoadingView() {
                containerView                   = UIView(frame: view.bounds)
                containerView.alpha             = 0
                containerView.backgroundColor   = .systemBackground
                
                view.addSubview(containerView)
            
            let activityIndicaterView = UIActivityIndicatorView(style: .large)
                containerView.addSubview(activityIndicaterView)
                activityIndicaterView.translatesAutoresizingMaskIntoConstraints = false
            
                NSLayoutConstraint.activate([
                    activityIndicaterView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
                    activityIndicaterView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor)
                ])
        
                UIView.animate(withDuration: 0.25) { containerView.alpha = 0.8 }
                activityIndicaterView.startAnimating()
        }
    
    
        func dismisLoadingView() {
                DispatchQueue.main.async {
                containerView.removeFromSuperview()
                containerView = nil
                }
        }
        func showEmptyStateView(with message: String, in view1: UIView) {
                let emptyStateView = GFEmptyStateView(message: message)
                emptyStateView.frame = view1.bounds
                view1.addSubview(emptyStateView)
    }
    
    
}
