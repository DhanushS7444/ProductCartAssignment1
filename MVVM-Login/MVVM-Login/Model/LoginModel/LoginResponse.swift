//
//  LoginResponse.swift
//  MVVM-Login
//
//  Created by Dhanush S on 06/02/23.
//

import Foundation

struct LoginResponse : Decodable {
    let result: Bool?
    let errorMessage: String?
}
