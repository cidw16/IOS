//
//  ProductTableViewCell.swift
//  Tarea 3
//
//  Created by user166916 on 3/27/20.
//  Copyright © 2020 user166916. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    
    @IBOutlet weak var ImageCell: UIImageView!
    @IBOutlet weak var ProductName: UILabel!
    
    @IBOutlet weak var Date: UILabel!
    
    func SetupCell (product:Product) {
        ProductName.text = product.ProductName
        ImageCell.image = UIImage (named: product.Image)
        Date.text = product.date.getFormatted(dateStyle: .medium, timeStyle: .medium)
    }
}
