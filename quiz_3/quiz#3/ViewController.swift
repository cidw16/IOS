//
//  ViewController.swift
//  quiz#3
//
//  Created by user166916 on 4/4/20.
//  Copyright © 2020 user166916. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var TableView: UITableView!
    
    let itemList = [Item]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        insertItems()
    }
    
    func insertItems () {
        let realmManager = RealManager()
        
        let items = realmManager.getAllCategories()
        
        //if let items = categories, items.isEmpty {
        
            
            
        //} else {
            //self.categories = categories
            //tableView.reloadData()
        //}
        
    }
    

}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
            let cell = UITableViewCell()
            cell.textLabel?.text = itemList[indexPath.row].name
            return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
}

