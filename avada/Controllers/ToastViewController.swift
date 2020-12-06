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
    
    @IBOutlet weak var Body: UITextView!
    let db = Firestore.firestore()
    var toasts : [Toast] = []
    var rowFromNSC : Int = 0
    var name = ""
    var body = ""
    var toastFromSVC  : [Toast] = []
    var fromTCCategory : String!
    var fromTCTime : Int!
    
   
    
    override func viewDidLoad() {
        

        Name.layer.cornerRadius = 15
        Body.layer.cornerRadius = 15
        Name.layer.masksToBounds = true
        
        if fromTCTime == nil {
        name = toastFromSVC[rowFromNSC].name
        Name.text = name
        body = toastFromSVC[rowFromNSC].body
            Body.text = body
            
        }
        else{
            print("loading data...")
            loadData()
        
   
          
        }
        
        
        
        
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
                            print(self.toasts.count)
                            
                            
                            
                            
                            }
                       
                        
                    }
                 
                }
                
            }
         
       
            for  i in 0...self.toasts.count-1{
            
                if self.toasts[i].category.contains(self.fromTCCategory!) {
                   // var  random : Int = Int.random(in: 1..<toasts[i].
                    self.name = self.toasts[i].name
                    self.Name.text = name
                    
                    self.body = self.toasts[i].body
                    self.Body.text = body
                    
                    
                }
                
                else {
                    
                    print ("error with finding proper toast from the toasList")
                }
                
            }
        }
    }
    
   
    
}
