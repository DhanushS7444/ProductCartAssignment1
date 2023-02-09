//
//  LoginViewModel.swift
//  MVVM-Login
//
//  Created by Dhanush S on 06/02/23.
//

import Foundation

protocol LoginViewModelDelegate {
    func validationResults(results: LoginResponse?)
}


struct LoginViewModel {
    
    var delegate: LoginViewModelDelegate?
    
    func loginUser(loginRequest: LoginRequest) {
        let validationResult = LoginValidation().Validate(loginRequest: loginRequest)
        if (validationResult.success)  {
            DispatchQueue.main.async {
                self.delegate?.validationResults(results: LoginResponse(result: true, errorMessage: nil))
            }
        } else {
            self.delegate?.validationResults(results: LoginResponse(result: false, errorMessage: validationResult.error))
        }
    }
}
