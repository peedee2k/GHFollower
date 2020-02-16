//
//  GFAvatarImageView.swift
//  GHFollower
//
//  Created by Pankaj Sharma on 2/10/20.
//  Copyright © 2020 Pankaj Sharma. All rights reserved.
//

import UIKit

class GFAvatarImageView: UIImageView {
            let placeholderImage    = UIImage(named: "avatar-placeholder")!
            let cache               = NetworkManager.shared.caches
  

    override init(frame: CGRect) {
            super.init(frame: frame)
            configur()
    }
    
    required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
    }
    
    private func configur() {
            translatesAutoresizingMaskIntoConstraints = false
            layer.cornerRadius  = 5
            clipsToBounds       = true
            image               = placeholderImage
    }
    
    func downloadImage(from urlString: String) {
        
            let cacheKey    = NSString(string: urlString)
            if let image    = cache.object(forKey: cacheKey) {
                self.image  = image
                return
            }
            guard let url   = URL(string: urlString) else { return }
            let task        = URLSession.shared.dataTask(with: url) { [weak self](data, response, error) in
            guard let self  = self else { return }
            if error != nil { return }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200  else {
                return
            }
            guard let data = data else { return }
            guard let image = UIImage(data: data) else { return }
           
            self.cache.setObject(image, forKey: cacheKey)
                
            DispatchQueue.main.async { self.image = image }
            }
            task.resume()
    }
    
        
        
       
    
    
}