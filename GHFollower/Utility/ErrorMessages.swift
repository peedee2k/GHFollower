//
//  ErrorMessages.swift
//  GHFollower
//
//  Created by Pankaj Sharma on 2/5/20.
//  Copyright © 2020 Pankaj Sharma. All rights reserved.
//

import Foundation

enum GFError: String, Error {
    case invalidUser = "This user requested invalid user, Please try again"
    case unableToComplete = "Unable to complete request,Please check internet connection, Try again"
    case invalidResponse = "Response from server was invalide, Please try again"
    case invalidData = "Data from server was invalide, Please try again"
    case prob = "Here"
}
