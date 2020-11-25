//
//  TamadaViewController.swift
//  avada
//
//  Created by Irakli Grigolia on 9/19/20.
//  Copyright © 2020 Irakli Grigolia. All rights reserved.
//

import UIKit

class TamadaViewController : UIViewController{
    
    @IBOutlet weak var button5: UIButton!
    
    @IBOutlet weak var button7: UIButton!
    
    @IBOutlet weak var button6: UIButton!
    
    @IBOutlet weak var button1: UIButton!
    
    @IBOutlet weak var button2: UIButton!
    
    @IBOutlet weak var button3: UIButton!
    
    @IBOutlet weak var button4: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button1.layer.cornerRadius = 10
        button2.layer.cornerRadius = 10
        button3.layer.cornerRadius = 10
        button4.layer.cornerRadius = 10
        
        button5.contentVerticalAlignment = .fill
        button5.contentHorizontalAlignment = .fill
        button6.contentVerticalAlignment = .fill
        button6.contentHorizontalAlignment = .fill
        button7.contentVerticalAlignment = .fill
        button7.contentHorizontalAlignment = .fill
        
        button5.isHighlighted = false
        
        //TopView.layer.cornerRadius = 5
        
    }
}
