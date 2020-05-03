//
//  HistoryHeaderTableViewCell.swift
//  ProyectoFinal
//
//  Created by user166916 on 5/2/20.
//  Copyright © 2020 user166916. All rights reserved.
//

import UIKit

class HistoryHeaderTableViewCell: UITableViewHeaderFooterView {


    @IBOutlet weak var nameLabel: UILabel!

    @IBOutlet weak var totalAmountLabel: UILabel!
    
    func setupCell (budget: Budget) {
        
        self.nameLabel.text = budget.name
        self.totalAmountLabel.text = String(format:"%.1f",budget.amount)
        
        if budget.amount <= 0 {
            self.totalAmountLabel.textColor = .red
        }
        
    }
    
}
