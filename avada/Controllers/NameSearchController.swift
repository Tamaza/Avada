//
//  NameSearchController.swift
//  avada
//
//  Created by Irakli Grigolia on 11/29/20.
//  Copyright © 2020 Irakli Grigolia. All rights reserved.
//

import UIKit
import Firebase

class NameSearchViewController : UIViewController{

    @IBOutlet weak var SBar: UISearchBar!
    
    @IBOutlet weak var TView: UITableView!
    var row : Int = 0
    var categoryFromSVC = ""
    let db = Firestore.firestore()
    var toasts : [Toast] = []
    var toastNames : [String] = []
    var searchdata: [String]!
    var searching = false
    
    override func viewDidLoad() {
       
        loadData()
        TView.dataSource = self
        TView.delegate = self
        TView.layer.cornerRadius = 15
        SBar.layer.cornerRadius = 15
        SBar.clipsToBounds = true;
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is ToastViewController {
            let vc = segue.destination as! ToastViewController
            vc.rowFromNSC = self.row
            vc.toastFromSVC = self.toasts
          
           
                
            
        }
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
                            if category == self.categoryFromSVC {
                            let newToast = Toast(category: category, name: name, body: body)
                            self.toasts.append(newToast)
                            print(self.toasts)
                            
                            DispatchQueue.main.async {
                                self.TView.reloadData()
                            }
                            }
                        }
                        
                    }
                    for i in 0...self.toasts.count-1{
                        
                        self.toastNames.append( self.toasts[i].name)
                        self.searchdata = self.toastNames
                     
                    }
                }
                
            }
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

        
        searchdata = toastNames.filter({$0.prefix(searchText.count) == searchText})
        searching = true
        TView.reloadData()
   }
    
    
    
}


extension NameSearchViewController : UITableViewDataSource{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if searching {
            return searchdata.count
        }
        else {
            return toastNames.count
        }
      
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier2, for: indexPath)
        
        if searching{
            cell.textLabel?.text = searchdata[indexPath.row]
        }
        else {
            cell.textLabel?.text = toastNames[indexPath.row]

        }
        
        
        return cell
    }

}

extension NameSearchViewController : UITableViewDelegate {
    
func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    self.row = indexPath.row
   
    self.performSegue(withIdentifier: "toToast", sender: self)
    
}
    
  

}
