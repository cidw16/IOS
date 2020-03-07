//
//  NameListViewController.swift
//  Clase2
//
//  Created by Estudiantes on 2/29/20.
//  Copyright © 2020 Estudiantes. All rights reserved.
//

import UIKit

class NameListViewController: UIViewController {
    
    @IBOutlet weak var TableView: UITableView!
    var personList = [Person]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        TableView.delegate = self
        TableView.dataSource = self
    }
    
    @IBAction func addNameAction(_ sender: Any) {
      
        if let addNameViewController = self.storyboard?.instantiateViewController(identifier: "AddNameViewController") as? AddNameViewController {
            
            addNameViewController.delegate = self
            
            addNameViewController.modalPresentationStyle = .fullScreen
            self.present(addNameViewController, animated: true, completion: nil)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension NameListViewController:UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personList.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
            else {
                return UITableViewCell()
        }
        let person = personList[indexPath.row]
        cell.textLabel?.text=person.name
        
        return cell
    }
}

extension NameListViewController:AddNameViewControllerDelegate{
    
    func addPerson(person: Person) {
        self.personList.append(person)
        TableView.reloadData()
    }
}
