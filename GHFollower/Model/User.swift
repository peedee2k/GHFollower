//
//  User.swift
//  GHFollower
//
//  Created by Pankaj Sharma on 1/22/20.
//  Copyright © 2020 Pankaj Sharma. All rights reserved.
//

import Foundation

struct User: Codable {
    let logsdsdsin: String
    let avatarUrl: String
    let name: String?
    let location: String?
    let bio: String?
    let public_repos: Int
    let public_gists: Int
    let html_url: String
    let following: Int
    let followers: Int
    let created_at: String
}
