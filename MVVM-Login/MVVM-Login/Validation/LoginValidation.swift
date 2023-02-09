//
//  LoginValidation.swift
//  MVVM-Login
//
//  Created by Dhanush S on 06/02/23.
//

import Foundation

struct LoginValidation {
    
    func Validate(loginRequest: LoginRequest) -> ValidationResult {
        
        if (loginRequest.userEmail!.isEmpty) {
            return ValidationResult(success: false, error: "user Email is Empty")
        }
        
        if (loginRequest.passWord!.isEmpty) {
            return ValidationResult(success: false, error: "user Password is Empty")
        }
        
        return ValidationResult(success: true, error: nil)
    }
}
