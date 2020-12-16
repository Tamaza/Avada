//
//  StartScreenViewController.swift
//  avada
//
//  Created by Irakli Grigolia on 12/14/20.
//  Copyright © 2020 Irakli Grigolia. All rights reserved.
//

import  UIKit
import Firebase

class StartScreenViewController : UIViewController {
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var registerButton: UIButton!
    
    override func viewDidLoad() {
        
        loginButton.layer.cornerRadius = 10
        registerButton.layer.cornerRadius = 10
    }
    
    
    
    
}

