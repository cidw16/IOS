//
//  CustomTableViewCell.swift
//  Quiz_3
//
//  Created by user166916 on 3/28/20.
//  Copyright © 2020 user166916. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    
    @IBOutlet weak var label: UILabel!
    
    func setupCell (val:Value) {
        label.text = val.multValue
    }
    
}
