//
//  AddExpensesViewController.swift
//  ProyectoFinal
//
//  Created by user166916 on 5/1/20.
//  Copyright © 2020 user166916. All rights reserved.
//

import UIKit


protocol AddExpensesViewControllerProtocol: class {
    func addTransaction(budget: Budget, transaction: Transaction)
}

class AddExpensesViewController: UITableViewController {

    var budget: Budget?
    
    @IBOutlet weak var remainingDays: UILabel!
    @IBOutlet weak var totalAmount: UILabel!
    
    
    @IBOutlet weak var addIncomeButton: UIButton!
    
    @IBOutlet weak var addExpenseButton: UIButton!
    
    @IBOutlet weak var amountTextField: UITextField!
    
    @IBOutlet weak var descriptionTextField: UITextField!
    
    weak var delegate: AddExpensesViewControllerProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        fillValues()
    }
    
    @IBAction func addIncomeAction(_ sender: Any) {
        if  descriptionTextField.text!.count > 0,
            amountTextField.text!.count > 0 {
            
            //Convert amount
            let amount = Double (amountTextField.text!)!
            
            delegate?.addTransaction(budget: self.budget!, transaction:  Transaction(description: descriptionTextField.text!, amount: amount))
        }
        else {
            let alertController = UIAlertController(title: "Error", message: "Debe llenar todos los datos", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(action)
            present(alertController, animated: true, completion: nil)
        }
    }
    
    
    @IBAction func addExpenseAction(_ sender: Any) {
        if  descriptionTextField.text!.count > 0,
            amountTextField.text!.count > 0 {
            
            //Convert amount
            let amount = Double (amountTextField.text!)! * -1
            
            delegate?.addTransaction(budget: self.budget!, transaction:  Transaction(description: descriptionTextField.text!, amount: amount))
        } else {
            let alertController = UIAlertController(title: "Error", message: "Debe llenar todos los datos", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(action)
            present(alertController, animated: true, completion: nil)
        }
    }
    
    func fillValues () {
        var timeInterval: TimeInterval
        let cal = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)
        
        var nextDate: Date?
        
        if let budget = self.budget {
            
            switch budget.periodicity {
            case "Weekly":
                nextDate = cal!.date(byAdding: NSCalendar.Unit.day, value: 7, to: budget.startDate, options: NSCalendar.Options.matchLast)
            case "Bi-Weekly":
                nextDate = cal!.date(byAdding: NSCalendar.Unit.day, value: 14, to: budget.startDate, options: NSCalendar.Options.matchLast)
            case "Montly":
                nextDate = cal!.date(byAdding: NSCalendar.Unit.day, value: 30, to: budget.startDate, options: NSCalendar.Options.matchLast)
            default:
                nextDate = Date()
            }
            
            timeInterval = nextDate!.timeIntervalSince(Date())
            
            totalAmount.text = String(format:"%.1f",budget.amount)
            remainingDays.text = timeInterval.stringFromTimeInterval()
        }
    }

}
