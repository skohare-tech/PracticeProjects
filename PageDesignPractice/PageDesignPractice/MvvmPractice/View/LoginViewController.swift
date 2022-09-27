//
//  LoginViewController.swift
//  PageDesignPractice
//
//  Created by Admin on 18/01/22.
//

import UIKit

class LoginViewController: UIViewController, LoginViewModelDelegate {
    
    @IBOutlet weak var lblTextUserName: UILabel!
    
    @IBOutlet weak var lblUserName: UILabel!
    
    func didReceiveLoginResponse(loginResponse: LoginResponse?) {
        
        if let data = loginResponse?.data
        {
            debugPrint("Response:")

            debugPrint("Username:  \(data.email)")
            self.lblUserName.text=data.name
            self.lblTextUserName.text="Name : "


        }
    }
    
    
    @IBAction func resetBtnClicked(_ sender: Any) {
        
        self.lblTextUserName.text=""
        self.lblUserName.text=""
        self.password.text = ""
    }
    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    private var loginViewModel = LoginViewModel()

    override func viewDidLoad() {
        
        self.lblTextUserName.text=""
        self.lblUserName.text=""
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loginViewModel.delegate = self

    }
    

    @IBAction func loginBtnClicked(_ sender: Any) {
        
        
        let request = LoginRequest(email: userName.text, password: password.text)
        loginViewModel.loginUser(loginRequest: request)
    }
    
}
