//
//  NetworkManagere.swift
//  GHFollower
//
//  Created by Pankaj Sharma on 1/22/20.
//  Copyright © 2020 Pankaj Sharma. All rights reserved.
//

import UIKit

class NetworkManager {
        static let shared   = NetworkManager()
        private let baseURL  = "https://api.github.com/users/"
        let caches   = NSCache<NSString, UIImage>()
    
    init() {}
    
    // Network call to get all the followers
    
    func getFollower(for username: String, page: Int, complited: @escaping  (Result<[Follower], GFError>) -> Void) {
        let endPoint = baseURL + "\(username)/followers?per_page=100&page=\(page)"
        guard let url = URL(string: endPoint) else {
            complited(.failure(.invalidUser))
            return
        }

        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let _ = error {
                complited(.failure(.unableToComplete))
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                complited(.failure(.invalidResponse))
                return
            }
            guard let data = data else  {
                complited(.failure(.invalidData))
                return
            }
            do {
                let decoder                     = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers                   = try decoder.decode([Follower].self, from: data)
                complited(.success(followers))
                }
            catch {
                complited(.failure(.invalidData))
            }
            
        }
            task.resume()
    }
    
    // Network call to get User info (Details)
    func getUser(for username: String, complited: @escaping  (Result<User, GFError>) -> Void) {
        let endPoint = baseURL + "\(username)"
        guard let url = URL(string: endPoint) else {
            complited(.failure(.invalidUser))
            return
        }
    
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let _ = error {
                complited(.failure(.unableToComplete))
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                complited(.failure(.invalidResponse))
                return
            }
            guard let data = data else  {
                complited(.failure(.invalidData))
                return
            }
            do {
                let decoder                     = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                let users                       = try decoder.decode(User.self, from: data)
                complited(.success(users))
                }
            catch {
                complited(.failure(.invalidData))
            }
        }
            task.resume()
    }
    
}
