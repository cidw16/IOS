//
//  HistoryTableViewCell.swift
//  ProyectoFinal
//
//  Created by user166916 on 5/2/20.
//  Copyright © 2020 user166916. All rights reserved.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {

    @IBOutlet weak var transactionDescLabel: UILabel!
    
    @IBOutlet weak var transactionAmount: UILabel!
    
    func setupCell (transaction: Transaction) {
        transactionDescLabel.text = transaction.tranDescription
        transactionAmount.text = String(format:"%.1f",transaction.amount)
        
        if transaction.amount <= 0 {
            transactionAmount.textColor = .red
        }
    }
    
}
