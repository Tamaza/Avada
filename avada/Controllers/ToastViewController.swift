//
//  ToastController.swift
//  avada
//
//  Created by Irakli Grigolia on 11/29/20.
//  Copyright © 2020 Irakli Grigolia. All rights reserved.
//

import UIKit
import Firebase


class ToastViewController : UIViewController {
    
    @IBOutlet weak var Name: UILabel!
    
    @IBOutlet weak var continueBTN: UIButton!
    
    @IBOutlet weak var Body: UITextView!
    let db = Firestore.firestore()
    var toasts : [Toast] = []
    var rowFromNSC : Int = 0
    var name = ""
    var body = ""
    var toastFromSVC  : [Toast] = []
    var fromTCCategory : String!
    var fromTCTime : Int!
    var num : [Int] = []
    var time : Int!
    var backButton : UIBarButtonItem!
    var newToast : [Toast] = []
    
   
    
    override func viewDidLoad() {
        print("shemovedi sceneshi")
        self.navigationController?.interactivePopGestureRecognizer!.isEnabled = false

//             // Replace the default back button
//            self.navigationItem.setHidesBackButton(true, animated: false)
//        self.backButton = UIBarButtonItem(title: "< Back", style: UIBarButtonItem.Style.plain, target: self, action: "goBack")
//            self.navigationItem.leftBarButtonItem = backButton
        
        
        
        continueBTN.layer.cornerRadius = 15
        Name.layer.cornerRadius = 15
        Body.layer.cornerRadius = 15
        Name.layer.masksToBounds = true
        
        if toastFromSVC.isEmpty == false{
            continueBTN.isHidden = true
        }
        
        if self.time == nil && self.fromTCTime == nil {
        name = toastFromSVC[rowFromNSC].name
        Name.text = name
        body = toastFromSVC[rowFromNSC].body
            Body.text = body
            
        }
        else{
            if self.time == nil{
            self.time = fromTCTime
            }
            else {
                self.fromTCTime = self.time
            }
            toastFromSVC = []
            print("loading data...")
            loadData()
        
   
          
        }
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        print("shemovedi sceneshi")
        self.navigationController?.interactivePopGestureRecognizer!.isEnabled = false

//             // Replace the default back button
//            self.navigationItem.setHidesBackButton(true, animated: false)
//        self.backButton = UIBarButtonItem(title: "< Back", style: UIBarButtonItem.Style.plain, target: self, action: "goBack")
//            self.navigationItem.leftBarButtonItem = backButton
        
        
        
        continueBTN.layer.cornerRadius = 15
        Name.layer.cornerRadius = 15
        Body.layer.cornerRadius = 15
        Name.layer.masksToBounds = true
        
        if toastFromSVC.isEmpty == false{
            continueBTN.isHidden = true
        }
        
        if self.time == nil && self.fromTCTime == nil {
        name = toastFromSVC[rowFromNSC].name
        Name.text = name
        body = toastFromSVC[rowFromNSC].body
            Body.text = body
            
        }
        else{
            if self.time == nil{
            self.time = fromTCTime
            }
            else {
                self.fromTCTime = self.time
            }
            toastFromSVC = []
            print("loading data...")
            loadData()
        
   
          
        }
        

    }
    
    
    
    
    func goBack() {
        
        self.performSegue(withIdentifier: "toTamadaController", sender: self)
        }
    
    @IBAction func continueBTN(_ sender: Any) {
        self.performSegue(withIdentifier: "toGifController", sender: self)
    }
    
    func loadData(){
     
        toasts = []
        
        db.collection(K.FStore.collectionName).getDocuments { [self] (querySnapshot, error) in
            if let e = error {
                print ("There was an issue retrieving data from db. \(e)")
            } else {
                if let snapshotDocuments = querySnapshot?.documents {
                    for doc in snapshotDocuments {
                        let data = (doc.data())
                        if let category = data[K.FStore.category] as? String, let name = data[K.FStore.name] as? String, let body = data[K.FStore.body] as? String {
                            let newToast = Toast(category: category, name: name, body: body)
                            self.toasts.append(newToast)
    
       
                            }
           
                    }
                 
                }
                for  i in 0...self.toasts.count-1{
                                    
                    if self.toasts[i].category.contains(self.fromTCCategory!) {
                        self.newToast.append(self.toasts[i])
                        print(self.newToast,"new toastsadsadsad")
                        if self.num.contains(i){
                            
                            continue
                        }
                        else {
                        self.num.append(i)
                            print(self.num, "nuummm")
                        }
                     
                    }
            }
                
            }
         
       
            for  i in 0...self.toasts.count-1{
            
                if self.toasts[i].category.contains(self.fromTCCategory!) {
                    
                    
                    var  random  = Int.random(in: 0..<num.count)
                        print (num, "nummmmm")
                        print (random,"randooooom")
                    print(self.toasts.count,"toasssttt")
                    self.name = self.toasts[random].name
                    self.Name.text = name
                    
                    self.body = self.toasts[random].body
                    self.Body.text = body
                    
                    
                }
                
                else {
                    
                    print ("error with finding proper toast from the toasList")
                }
                
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is gifController {
            print(self.time,"timessee")
            let vc = segue.destination as! gifController
            
            if self.fromTCTime != nil {
                vc.timeFromTC = self.fromTCTime
                
            }
            else{
                vc.timeFromTC = self.time
                
            }
            vc.categoryFromTC = self.fromTCCategory
  
      
            
        }
        
        
    }
    
   
    
}
