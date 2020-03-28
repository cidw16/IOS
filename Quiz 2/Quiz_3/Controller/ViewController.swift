//
//  ViewController.swift
//  Quiz_3
//
//  Created by user166916 on 3/28/20.
//  Copyright © 2020 user166916. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var TableView: UITableView!
    
    let customTableViewCellIdentifier = "CustomTableViewCell"
    var multList = [Value]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        registerCustomCell()
        fillValues()
    }
    
    func fillValues () {
        for n in 1...100 {
            multList.append(Value (multValue: "8 x " + String(n) + " = "))
        }
        
    }
    
    func registerCustomCell() {
        let nib = UINib(nibName: customTableViewCellIdentifier, bundle: nil)
        TableView.register(nib, forCellReuseIdentifier: customTableViewCellIdentifier)
    }
    
}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return multList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: customTableViewCellIdentifier)  as? CustomTableViewCell else {
            let cell = UITableViewCell()
            cell.textLabel?.text = "NO EXISTE"
            return cell
        }
        
        cell.setupCell(val: multList[indexPath.row])
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}


