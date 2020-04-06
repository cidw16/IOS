//
//  AddProductTableViewController.swift
//  Tarea 3
//
//  Created by user166916 on 3/28/20.
//  Copyright © 2020 user166916. All rights reserved.
//

import UIKit

protocol AddProductsViewControllerProtocol: class {
    func addProduct(product: Product)
}

class AddProductTableViewController: UIViewController {

    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var quantityTextField: UITextField!
    
    weak var delegate: AddProductsViewControllerProtocol?
    
    var product: Product?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let prod = self.product {
            nameTextField.isEnabled = false
            quantityTextField.isEnabled = false
            
            nameTextField.text = prod.productName
            quantityTextField.text = String (prod.quantity)
        } else {
            quantityTextField.keyboardType = .numberPad
            addProductNavigationButton()
        }
    }
    
    func addProductNavigationButton() {
        let addNavigationButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveProductAction(sender:)))
        
        navigationItem.rightBarButtonItem = addNavigationButton
    }
    
    @objc func saveProductAction (sender:UIBarButtonItem) {
        if let name = nameTextField.text, quantityTextField.text!.count > 0, name.count > 0 {
            
            let product = Product (productName: nameTextField.text!, quantity: Int (quantityTextField.text!)!,imageName: "Product" + String (Int.random(in: 1 ... 5)))
            
            delegate?.addProduct(product: product)
        } else {
            let alertController = UIAlertController(title: "Error", message: "Debe llenar todos los datos", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(action)
            present(alertController, animated: true, completion: nil)
        }    }
}
