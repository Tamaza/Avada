//
//  RegisterController.swift
//  avada
//
//  Created by Irakli Grigolia on 12/14/20.
//  Copyright © 2020 Irakli Grigolia. All rights reserved.
//

import UIKit
import FirebaseAuth

class RegisterViewController : UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func registerUser(_ sender: Any) {
        
        if  let password = passwordTextField.text , let email = emailTextField.text{
        
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            
            if let e = error {
                print(e)
            } else {
                self.performSegue(withIdentifier: "toMainScreen", sender: self)
            }
        }
        }
    }
}
