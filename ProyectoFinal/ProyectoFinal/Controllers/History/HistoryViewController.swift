//
//  HistorialViewController.swift
//  ProyectoFinal
//
//  Created by user166916 on 4/13/20.
//  Copyright © 2020 user166916. All rights reserved.
//

import UIKit
import RealmSwift

class HistoryViewController: UIViewController {

     
    @IBOutlet weak var historyTableView: UITableView!
    
    var budgetList = List<Budget> ()
        
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //fillBudgets()
        registersCustomCells()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        fillBudgets()
    }
    
    func fillBudgets () {
        let realmManager = RealmManager()
        self.budgetList = List<Budget>()
        
        let budgets = realmManager.getAllBudgets()!
        self.budgetList.append(objectsIn: budgets)
        
        historyTableView.reloadData()
    }
    
    func registersCustomCells() {
        let nib = UINib(nibName: R.nib.historyTableViewCell.name, bundle: nil)
        let headerNib = UINib(nibName: R.nib.historyHeaderTableViewCell.name, bundle: nil)
        
        historyTableView.register(nib, forCellReuseIdentifier: R.nib.historyTableViewCell.name)
        
        historyTableView.register(headerNib, forHeaderFooterViewReuseIdentifier: R.nib.historyHeaderTableViewCell.name)
    }

}

extension HistoryViewController: UITableViewDelegate, UITableViewDataSource {
   
    func numberOfSections(in tableView: UITableView) -> Int {
        return budgetList.count
   }
   
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return budgetList[section].transactions.count
   }
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        guard let cell = historyTableView.dequeueReusableCell(withIdentifier: R.nib.historyTableViewCell.name) as? HistoryTableViewCell else {
           return UITableViewCell()
       }
        cell.setupCell(transaction: budgetList[indexPath.section].transactions[indexPath.row])
       return cell
   }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30.0
    }
   
   //METODOS NECESARIOS PARA EL HEADER
   func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
       return 40.0
   }
   
   func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let cell = historyTableView.dequeueReusableHeaderFooterView(withIdentifier: R.nib.historyHeaderTableViewCell.name) as? HistoryHeaderTableViewCell else {
           return UIView()
       }
        cell.setupCell(budget: budgetList[section])
    cell.backgroundColor = .systemBlue
        return cell
   }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let realmManager = RealmManager()
            let budget = self.budgetList[indexPath.section]
            
            // Declare Alert message
            let dialogMessage = UIAlertController(title: "Confirm", message: "Desea eliminar esta transaccion?", preferredStyle: .alert)
            
            // Create OK button with action handler
            let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
                realmManager.removeTransactionFromBudget(budget: budget, transactionIndex: indexPath.row)
                    
                tableView.beginUpdates()
                tableView.deleteRows(at: [indexPath], with: .fade)
                tableView.endUpdates()
                
                tableView.reloadData()
            })
            
            // Create Cancel button with action handlder
            let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (action) -> Void in
                
            }
            
            //Add OK and Cancel button to dialog message
            dialogMessage.addAction(ok)
            dialogMessage.addAction(cancel)
            
            // Present dialog message to user
            self.present(dialogMessage, animated: true, completion: nil)
        }
    }
}


