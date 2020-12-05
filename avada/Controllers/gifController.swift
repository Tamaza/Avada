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
    let jeremyGif = UIImage.gif(name: "jeremy")
    
  
    override func viewDidLoad() {
        imageView.loadGif(name: "jeremy")
        
    }
    
    //An animated UIImage
   

    // A UIImageView with async loading
    
    
    

   
    
}
