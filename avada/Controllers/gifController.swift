//
//  gifController.swift
//  avada
//
//  Created by Irakli Grigolia on 12/4/20.
//  Copyright © 2020 Irakli Grigolia. All rights reserved.
//

import UIKit
import SwiftGifOrigin

class gifController : UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    var timeFromTC : Double = 0
    
    
  
    override func viewDidLoad() {
        //imageView.loadGif(name: "jeremy")
        
    }
    
//    let timer = Timer.scheduledTimer(timeInterval: , target: self, selector: #selector(fire), userInfo: nil, repeats: true)

    @objc func fire()
    {
        print("FIRE!!!")
    }
    
    //An animated UIImage
   

    // A UIImageView with async loading
    
    
    

   
    
}
