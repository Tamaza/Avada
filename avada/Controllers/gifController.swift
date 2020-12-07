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
    var timeFromTC : Int!
    var categoryFromTC : String!
    
    
    
  
    override func viewDidLoad() {
        //imageView.loadGif(name: "jeremy")
       print(timeFromTC,"timee")
        if timeFromTC == 10 {
        let timer = Timer.scheduledTimer(timeInterval: 3 , target: self, selector: #selector(fire), userInfo: nil, repeats: false)
        }
        else if timeFromTC == 15 {
            let timer = Timer.scheduledTimer(timeInterval: 15 , target: self, selector: #selector(fire), userInfo: nil, repeats: false)
            
        }
        
        else if timeFromTC == 20 {
            let timer = Timer.scheduledTimer(timeInterval: 20 , target: self, selector: #selector(fire), userInfo: nil, repeats: false)
        }
        
        
    }
    
  
    
   

    @objc func fire()
    {
        print("going to toast controller...")
        self.performSegue(withIdentifier: "toToast", sender: self)
    }
    
    //An animated UIImage
   

    // A UIImageView with async loading
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is ToastViewController {
            let vc = segue.destination as! ToastViewController
            vc.time = self.timeFromTC
            vc.fromTCCategory = self.categoryFromTC
        }

    }
    
}
