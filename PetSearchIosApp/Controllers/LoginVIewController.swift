//
//  LoginVIewController.swift
//  PetSearchIosApp
//
//  Created by Andrei Poliakov on 06.06.2019.
//  Copyright © 2019 Andrei Poliakov. All rights reserved.
//

import Foundation
import UIKit

class LoginViewController : UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginBtn: UIButton!
    
    @IBAction func clickLoginButton(_ sender: Any) {
        let password : String? = passwordTextField.text
        let email : String? = emailTextField.text
        
        if (email != nil) && (password != nil) && email == "admin@gmail.com" && password == "admin" {
            SecurityContext.instance().setUserData(email, password)
        }
        else {
            // There was a problem
            loginErrorAlert(title: "Oops!", message: "Don't forget to enter your email and password.")
        }
    }
    
    func loginErrorAlert(title: String, message: String) {
        // Called upon login error to let the user know login didn't work.
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}
