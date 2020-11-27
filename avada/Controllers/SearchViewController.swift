//
//  SearchViewController.swift
//  avada
//
//  Created by Irakli Grigolia on 9/19/20.
//  Copyright © 2020 Irakli Grigolia. All rights reserved.
//

import UIKit

class SearchViewController : UIViewController {
    
    
    @IBOutlet weak var SearchBar: UISearchBar!
    
    @IBOutlet weak var TableView: UITableView!
    
    var toasts : [Toast] = [
        Toast(category: "შერეული", name: "ცრემლები", body: "მოდით ამ ჭიქით ხავსმოკიდებულ ეკლესიას,ამ ეკლესიაში დანთებულ სანთელს,ამ სანთლის წინ დაღვრილ ცრემლებს და ამ ცრემლებში განდობილ,საიდუმლოს გაუმარჯოს.")
    
    ]
    
    override func viewDidLoad() {
        TableView.dataSource = self
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
    
    
extension SearchViewController : UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toasts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath)
        
        cell.textLabel?.text = "This is a cell"
        return cell
    }
    
        
    
    
    
}
