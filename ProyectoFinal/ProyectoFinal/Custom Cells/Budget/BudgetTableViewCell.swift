//
//  BudgetTableViewCell.swift
//  ProyectoFinal
//
//  Created by user166916 on 4/30/20.
//  Copyright © 2020 user166916. All rights reserved.
//

import UIKit

class BudgetTableViewCell: UITableViewCell {

    @IBOutlet weak var view: UIView!
    @IBOutlet weak var Amount: UILabel!
    @IBOutlet weak var BudgetName: UILabel!
    
    func SetupCell(budget:Budget) {
        self.Amount.text = "Monto: " + String(format:"%.1f",budget.amount)
        self.BudgetName.text = budget.name
        
        if budget.amount <= 0 {
            view.backgroundColor = .red
        } else {
            view.backgroundColor = UIColor(red: 153 / 255, green: 204 / 255, blue: 1, alpha: 1)
        }
    }
    
    
}
