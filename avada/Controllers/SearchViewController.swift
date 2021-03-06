//
//  SearchViewController.swift
//  avada
//
//  Created by Irakli Grigolia on 11/27/20.
//  Copyright © 2020 Irakli Grigolia. All rights reserved.
//


import UIKit
import Firebase

class SearchViewController : UIViewController, UISearchBarDelegate{
    
   
    @IBOutlet weak var SearchBar: UISearchBar!
    
    @IBOutlet weak var TableView: UITableView!
    
    let db = Firestore.firestore()
    var c = ""
    var r = 0
    var categoryNames : [String] = []
    var searchdata: [String]!
    var searching = false

//  var toasts : [Toast] = [
//        Toast(category: "შერეული", name: "ცრემლები", body: "მოდით ამ ჭიქით ხავსმოკიდებულ ეკლესიას,ამ ეკლესიაში დანთებულ სანთელს,ამ სანთლის წინ დაღვრილ ცრემლებს და ამ ცრემლებში განდობილ,საიდუმლოს გაუმარჯოს."),
//        Toast(category: "მანდილოსნების", name: "მშვენება მანდილოსანი", body: "ცის მშვენება არწივს, წყლის მშვენება ორაგულს, კლდის მშვენება ჯიხვს, ტყის მშვენება ირემს და სუფრის მშვენება მანდილოსანს გაუმარჯოს."),
//        Toast(category: "ახალი წელი", name: "თოვლის ბაბუ და ფიფქია", body: "გაუმარჯოს თოვლის ბაბუას და ფიფქიას: არც ბერდებიან, არც ავად ხდებიან, ფულიც ყოველთვის აქვთ საჩურების საყიდლად. მოდით, ჩვენც მათნაირები ვყოფილიყავით!"),
//        Toast(category: "დაბადების დღე", name: "იმ ლამაზ ღამეს", body: "დაბადების დღის იმ ლამაზ ღამეს,შენი აკვნისთვის ღმერთს უკოცნია,დიდხანს სიცოცხლე შენთვის ცოტაა, დიდი სიცოცხლე დამილოცია, ცისარტყელა აკისკისდა,მიებჯინა კლდეს...თოლიები ზღვის ნაპირზე ნაზად კრავენ წრეს წვიმას იწყებს და წვეთები უღიმიან მზეს...გეფერები და გილოცავ დაბადების დღეს"),
//        Toast(category: "ახალი შენაძენი", name: "დიმპიტაური", body: "აბა მოდით იმ ახალ შენაძენს გაუმარჯოს რომელმაც აქ ყველა შეგვკვრიბა და დიდი ხნის უნახავი მეგობრები გვანახა, მოდი იმ შენაძენს გაუმარჯოს წარმოდგენა რო არ გვაქვს რა არის მარა დალევა გცინდა კამანდას"),
//        Toast(category: "ბიჭის ნათლობა", name: "ჯან-ღონე", body: "აბა დღეს მოინათლა ჩვენი საყვარელი (ნათლულის სახელი), გაუმარჯოს და სულ კარგ გზაზე ეაროს, ეშმაკი რომ შეხვდება ჩემსკენ გამოუშვას შობელძაღლს ვიცნობ მე კარად, მე მოვუვლი"),
//        Toast(category: "ახალი წელი", name: "გენაცვალოს ჩემი თავი", body: "აბა ახალ წელს გაუმარჯოს და გენაცვალოს ჩემი თავი")
//    ]
   var toasts : [Toast] = []
    
    override func viewDidLoad() {
        
        
        //upload()
        loadData()
        TableView.dataSource = self
        TableView.delegate = self
        TableView.layer.cornerRadius = 15
        SearchBar.layer.cornerRadius = 15
        
        SearchBar.delegate = self
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
                            print(self.toasts.count)
                            
                            
                            DispatchQueue.main.async {
                                self.TableView.reloadData()
           
                                }
                            }
                       
                        
                    }
                    for i in 0...self.toasts.count-1{
                        if self.categoryNames.contains(self.toasts[i].category ){
                            continue
                        
                            
                        }else{
                        self.categoryNames.append( self.toasts[i].category)
                        self.searchdata = self.categoryNames
                        }
                     
                    }
                }
                
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is NameSearchViewController {
            let vc = segue.destination as! NameSearchViewController
            vc.categoryFromSVC = self.c
            
          
           
                
            
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

        
        searchdata = categoryNames.filter({$0.prefix(searchText.count) == searchText})
        searching = true
        TableView.reloadData()
   }
    
    
    
    
    func upload(){
        for i in 0...toasts.count-1{
        db.collection(K.FStore.collectionName).addDocument(data: [
          K.FStore.category: toasts[i].category,
          K.FStore.name : toasts[i].name,
            K.FStore.body : toasts[i].body
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
    
    
}
    



    
extension SearchViewController : UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if searching {
            return searchdata.count
        }
        else {
            return categoryNames.count
        }
      
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath)
        
        if searching{
            cell.textLabel?.text = searchdata[indexPath.row]
        }
        else {
            cell.textLabel?.text = categoryNames[indexPath.row]

        }
        
        
        return cell
    }
    
}

extension SearchViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.r = indexPath.row
        self.c = self.toasts[r].category
        
        self.performSegue(withIdentifier: "toToastScreen", sender: self)
    }
    
}
