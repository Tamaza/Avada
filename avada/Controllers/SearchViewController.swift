//
//  SearchViewController.swift
//  avada
//
//  Created by Irakli Grigolia on 11/27/20.
//  Copyright © 2020 Irakli Grigolia. All rights reserved.
//


import UIKit
import Firebase

class SearchViewController : UIViewController{
    
   
    @IBOutlet weak var SearchBar: UISearchBar!
    
    @IBOutlet weak var TableView: UITableView!
    
    let db = Firestore.firestore()

//    var toasts : [Toast] = [
//        Toast(category: "შერეული", name: "ცრემლები", body: "მოდით ამ ჭიქით ხავსმოკიდებულ ეკლესიას,ამ ეკლესიაში დანთებულ სანთელს,ამ სანთლის წინ დაღვრილ ცრემლებს და ამ ცრემლებში განდობილ,საიდუმლოს გაუმარჯოს.")
//
//    ]
    var toasts : [Toast] = []
    
    override func viewDidLoad() {
        //upload()
        loadData()
        TableView.dataSource = self
        TableView.delegate = self
        TableView.layer.cornerRadius = 15
        SearchBar.layer.cornerRadius = 15
        SearchBar.clipsToBounds = true;
       
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func loadData(){
        
        toasts = []
        
        db.collection(K.FStore.collectionName).getDocuments { (querySnapshot, error) in
            if let e = error {
                print ("There was an issue retrieving data from db. \(e)")
            } else {
                if let snapshotDocuments = querySnapshot?.documents {
                    for doc in snapshotDocuments {
                        let data = (doc.data())
                        if let category = data[K.FStore.category] as? String, let name = data[K.FStore.name] as? String, let body = data[K.FStore.body] as? String {
                            let newToast = Toast(category: category, name: name, body: body)
                            self.toasts.append(newToast)
                            
                            
                            DispatchQueue.main.async {
                                self.TableView.reloadData()
                                print(self.toasts[0].name)
                            }
                        }
                        
                    }
                }
                
            }
        }
    }
    
    
    func upload(){
        db.collection(K.FStore.collectionName).addDocument(data: [
          K.FStore.category: toasts[0].category,
          K.FStore.name : toasts[0].name,
            K.FStore.body : toasts[0].body
        ]) {(error) in
            if let e = error {
                print("There was an issue uploading data to firestore, \(e)")
            }
            else {
                print("Successfully uploaded data")
            }
        }
        
    }
    
    
}
    



    
extension SearchViewController : UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toasts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath)
        
        cell.textLabel?.text = toasts[indexPath.row].category
        return cell
    }
    
}

extension SearchViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.performSegue(withIdentifier: "toToastScreen", sender: self)
    }
    
}
