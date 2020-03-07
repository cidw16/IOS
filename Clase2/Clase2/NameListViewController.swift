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
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "")!
    }
}

extension NameListViewController:AddNameViewControllerDelegate{
    func addPerson(person: Person) {
        print(person.name)
    }
}
