//
//  LoginRequest.swift
//  MVVM-Login
//
//  Created by Dhanush S on 06/02/23.
//

import Foundation

struct LoginRequest : Encodable {
    let userEmail: String?
    let passWord: String?
}
