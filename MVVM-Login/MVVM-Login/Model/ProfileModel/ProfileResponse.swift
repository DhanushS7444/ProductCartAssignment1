//
//  ProfileResponse.swift
//  MVVM-Login
//
//  Created by Dhanush S on 08/02/23.
//

import Foundation

// MARK: ProfileResponse
struct ProfileResponse : Decodable {
    let id, username, firstname, lastName: String?
    let dob, address, pointsEarned, walletBalance: String?
    
    enum CodingKeys: String, CodingKey {
        case id, username, firstname, lastName
        case dob, address, pointsEarned, walletBalance
    }
}
