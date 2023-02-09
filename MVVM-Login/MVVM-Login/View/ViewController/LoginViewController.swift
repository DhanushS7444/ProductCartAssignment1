//
//  LoginViewController.swift
//  MVVM-Login
//
//  Created by Dhanush S on 07/02/23.
//

import UIKit

//MARK: LoginViewController
class LoginViewController: UIViewController, LoginViewModelDelegate {
  
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var passWord: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    private var loginViewModel = LoginViewModel()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginViewModel.delegate = self
        self.setUpUI()
    }
    
    private func setUpUI() {
        userName.placeholder = "Username"
        passWord.placeholder = "Password"
    }

    //MARK: After taping on signin Sending Request to ViewModel
    @IBAction func loginTapped(_ sender: Any) {
        let request = LoginRequest(userEmail: userName.text, passWord: passWord.text)
        loginViewModel.loginUser(loginRequest: request)
    }
    
    //After Recieving Validation Result if error is nil pushing to DashBoardView
    func validationResults(results: LoginResponse?) {
        if(results?.errorMessage == nil && results?.result == true) {
            if let productVc = self.storyboard?.instantiateViewController(withIdentifier: "ProductViewController") as? ProductViewController {
                self.navigationController?.pushViewController(productVc, animated: true)
            }
        } else if (results?.errorMessage != nil) {
            let alert = UIAlertController(title: Constants.ErrorAlertTitle, message: results?.errorMessage, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: Constants.OkAlertTitle, style: .default))
            self.present(alert, animated: true)
        }
    }
   
}
