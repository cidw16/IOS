//
//  ShoppingViewController.swift
//  Tarea 3
//
//  Created by user166916 on 3/27/20.
//  Copyright © 2020 user166916. All rights reserved.
//

import UIKit

class ShoppingViewController: UIViewController {

    @IBOutlet weak var shoppingTableView: UITableView!
    
    let productTableViewCellIdentifier = "ProductTableViewCell"
    var productList = [Product]()

    override func viewDidLoad() {
        super.viewDidLoad()

        registerCustomCell()
        addShoppingNavigationButton()
    }
    
    func registerCustomCell() {
        let nib = UINib(nibName: productTableViewCellIdentifier, bundle: nil)
        shoppingTableView.register(nib, forCellReuseIdentifier: productTableViewCellIdentifier)
    }
    
    func addShoppingNavigationButton() {
        let addNavigationButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addProductAction(sender:)))
        
        navigationItem.rightBarButtonItem = addNavigationButton
    }
    
    @objc func addProductAction (sender:UIBarButtonItem) {
        if let addProductViewController = storyboard?.instantiateViewController(identifier: "AddProductTableViewController") as? AddProductTableViewController {
            addProductViewController.delegate = self
            navigationController?.pushViewController(addProductViewController, animated: true)
        }
        
    }
}

extension ShoppingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: productTableViewCellIdentifier)  as? ProductTableViewCell else {
            let cell = UITableViewCell()
            cell.textLabel?.text = "NO EXISTE"
            return cell
        }
        
        cell.SetupCell(product: productList[indexPath.row])
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let product = productList[indexPath.row]
        
        if let addProductViewController = storyboard?.instantiateViewController(identifier: "AddProductTableViewController") as? AddProductTableViewController
        {
                addProductViewController.product = product
            navigationController?.pushViewController(addProductViewController, animated: true)
        }
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            productList.remove(at: indexPath.row)
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        }

    }
    
}
extension ShoppingViewController: AddProductsViewControllerProtocol {
    func addProduct(product: Product) {
        
        
            productList.append(product)
            navigationController?.popViewController(animated: true)
            shoppingTableView.reloadData()
        
    }
}
