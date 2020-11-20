//
//  TamadaViewController.swift
//  avada
//
//  Created by Irakli Grigolia on 9/19/20.
//  Copyright © 2020 Irakli Grigolia. All rights reserved.
//

import UIKit

class TamadaViewController : UIViewController{
    
    @IBOutlet weak var TopView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        TopView.layer.cornerRadius = 5
        
    }
}
