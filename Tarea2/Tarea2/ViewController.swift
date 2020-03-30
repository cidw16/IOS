//
//  ViewController.swift
//  Tarea2
//
//  Created by user166916 on 3/29/20.
//  Copyright © 2020 user166916. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var numbersList: [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 1...100 {
            numbersList.append(i)
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numbersList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        cell.textLabel?.text = String(numbersList[indexPath.row])
        
        if numbersList[indexPath.row] % 2 == 0 {
            cell.backgroundColor = .red
        } else {
            cell.backgroundColor = .blue
        }
        
        return cell
        
    }
    
}


