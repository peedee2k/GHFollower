//
//  NetworkManagere.swift
//  GHFollower
//
//  Created by Pankaj Sharma on 1/22/20.
//  Copyright © 2020 Pankaj Sharma. All rights reserved.
//

import Foundation

class NetworkManager {
    static let shared   = NetworkManager()
           let baseURL  = "https://api.github.com/"
    init() {}
    
    func getFollower(for username: String, page: Int, complited: @escaping ([Follower]?, String?) -> Void) {
        let endPoint = baseURL + "\(username)/followers?per_page=100&page\(page)"
        guard let url = URL(string: endPoint) else {
            complited(nil, "This user requested invalid user, Please try again")
            return
        }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let _ = error {
                complited(nil, "Please check internet connection, Try again")
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                complited(nil, "Response from server was invalide, Please try again")
                return
            }
            guard let data = data else  {
                complited(nil, "Data from server was invalide, Please try again")
                return
            }
            do {
                let decoder                     = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers                   = try decoder.decode([Follower].self, from: data)
                    complited(followers, nil)
                }
            catch {
                    complited(nil, "Data from server was invalide, Please try again")
            }
            
        }
            task.resume()
    }
    
}
