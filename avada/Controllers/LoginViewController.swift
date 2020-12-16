//
//  LoginViewController.swift
//  avada
//
//  Created by Irakli Grigolia on 12/14/20.
//  Copyright © 2020 Irakli Grigolia. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController : UIViewController {
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    
    @IBAction func loginUser(_ sender: Any) {
        if let email = email.text, let password = password.text {
            
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            
            if let e = error {
                print (e)
            } else {
                self.performSegue(withIdentifier: "toStartScreen", sender: self)
                
            }
        }
        }
    }
}
