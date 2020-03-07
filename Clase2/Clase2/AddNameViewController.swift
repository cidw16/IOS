//
//  AddNameViewController.swift
//  Clase2
//
//  Created by Estudiantes on 2/29/20.
//  Copyright © 2020 Estudiantes. All rights reserved.
//

import UIKit

protocol AddNameViewControllerDelegate:class {
    func addPerson(person:Person)
}

class AddNameViewController: UIViewController {

    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    
    weak var delegate:AddNameViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func AddName(_ sender: Any) {
        
        let person = Person (name: firstNameTextField.text ?? "", lastName: lastNameTextField.text ?? "")
        
        delegate?.addPerson(person: person)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelarAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
