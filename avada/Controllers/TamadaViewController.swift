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
    
    @IBOutlet weak var TopView: UIView!
    @IBOutlet weak var BottomView: UIView!
    
    @IBOutlet weak var startButton: UIButton!
    var time : Int!
    var category : String!
    
    override func viewDidLoad() {
        time = 0
        category = ""
        startButton.isEnabled = false
        super.viewDidLoad()
        
        
        
    
    
        
        roundTopCorners(cornerRadius: 15, view: TopView)
        roundBottomCorners(cornerRadius: 15, view: BottomView)
        
        startButton.layer.cornerRadius = 10
        button1.layer.cornerRadius = 10
        button2.layer.cornerRadius = 10
        button3.layer.cornerRadius = 10
        button4.layer.cornerRadius = 10
        button5.layer.cornerRadius = 10
        button6.layer.cornerRadius = 10
        button7.layer.cornerRadius = 10
        
//        button5.contentVerticalAlignment = .fill
//        button5.contentHorizontalAlignment = .fill
//        button6.contentVerticalAlignment = .fill
//        button6.contentHorizontalAlignment = .fill
//        button7.contentVerticalAlignment = .fill
//        button7.contentHorizontalAlignment = .fill
//        
     
        //TopView.layer.cornerRadius = 5
        
    }
    
    
     func check(){
        if self.time != 0 && self.category != ""{
            startButton.isEnabled = true
        }
    }
    
    @IBAction func newYear(_ sender: Any) {
        category = ""
        category = "ახალი წელი"
    }
    
        
    @IBAction func birthDay(_ sender: Any) {
        category = ""
        category = "დაბადების დღე"
    }
    
    @IBAction func newPurchase(_ sender: Any) {
        category = ""
        category = "ახალი შენაძენი"
    }
    
    
    @IBAction func boyNatloba(_ sender: Any) {
        category = ""
        category = "ბიჭის ნათლობა"
        check()
    }
    
    
    @IBAction func tenMin(_ sender: Any) {
        time = 10
        check()
    }
    
    
    
    @IBAction func fifteenMin(_ sender: Any) {
        time = 15
        check()
    }
    
    
    @IBAction func twentyMin(_ sender: Any) {
        time = 20
        check()
    }
    
    
    func roundTopCorners(cornerRadius: Double, view : UIView) {
        view.layer.cornerRadius = CGFloat(cornerRadius)
        view.clipsToBounds = true
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    
func roundBottomCorners(cornerRadius: Double, view : UIView) {
    view.layer.cornerRadius = CGFloat(cornerRadius)
    view.clipsToBounds = true
    view.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
}
    
    
    
    
}
