//
//  FollowerListVC.swift
//  GHFollower
//
//  Created by Pankaj Sharma on 1/15/20.
//  Copyright © 2020 Pankaj Sharma. All rights reserved.
//

import UIKit

class FollowerListVC: UIViewController {
    
            enum Section { case main }
            
            var userName: String!
            var follower: [Follower] = []
            var page = 1
            var hasMoreFollower = true
            var dataSource: UICollectionViewDiffableDataSource<Section, Follower>!
            var collectionView: UICollectionView!
    
    

    override func viewDidLoad() {
            super.viewDidLoad()
            configureCollectionView()
            configureViewController()
            configureDataSource()
            getFollower(userName: userName, page: page)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            navigationController?.setToolbarHidden(false, animated: true)
    }
    
    func configureCollectionView() {
        
            collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.createThreeColoumFlowLayout(in: view))
            collectionView.delegate = self
            view.addSubview(collectionView)
            collectionView.backgroundColor = .systemBackground
            collectionView.register(GHFollowerCell.self, forCellWithReuseIdentifier: GHFollowerCell.resuableID)
    }

    
    
    func configureViewController() {
            view.backgroundColor = .systemBackground
            navigationController?.navigationBar.prefersLargeTitles = true
            navigationController?.navigationBar.tintColor = .systemGreen
    }
    
    func getFollower(userName: String, page: Int) {
        
            showLoadingView()
        
            NetworkManager.shared.getFollower(for: userName, page: page) { [weak self] result in
            
            guard let self = self else { return }
            self.dismisLoadingView()
            switch result {
            case .success(let follower):
            if follower.count < 100 { self.hasMoreFollower = false }
            self.follower.append(contentsOf: follower)
            
            print(self.follower.count)
            if self.follower.isEmpty {
                let message = "This user does not have any follower 😊"
                DispatchQueue.main.async { self.showEmptyStateView(with: message, in: self.view) }
                return
            }
            
            self.updateData()
            case .failure(let error):
            self.presentGFAlertOnMainThread(alertTitle: "Bad things happend", message: error.rawValue, buttonTitle: "Ok")
                       }
                    }
    }
    
    func configureDataSource() {
            dataSource = UICollectionViewDiffableDataSource<Section, Follower>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, follower) -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GHFollowerCell.resuableID, for: indexPath) as! GHFollowerCell
                cell.set(follower: follower)
                return cell
        })
    }
    
    func updateData() {
            var snapshot = NSDiffableDataSourceSnapshot<Section, Follower>()
                snapshot.appendSections([.main])
                snapshot.appendItems(follower)
                dataSource.apply(snapshot, animatingDifferences: true)
    }

}

extension FollowerListVC: UICollectionViewDelegate {
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
        let offSetY         = scrollView.contentOffset.y
        let contentHeight   = scrollView.contentSize.height
        let height          =   scrollView.frame.size.height
        
        if offSetY > contentHeight - height {
            guard hasMoreFollower else { return }
            page += 1
            getFollower(userName: userName, page: page)
        }
    }
    
}
