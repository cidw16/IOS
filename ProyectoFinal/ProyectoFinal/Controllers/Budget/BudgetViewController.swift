//
//  PresupuestosViewController.swift
//  ProyectoFinal
//
//  Created by user166916 on 4/13/20.
//  Copyright © 2020 user166916. All rights reserved.
//

import UIKit
import RealmSwift

class BudgetViewController: UIViewController {

    var budgetList  = List<Budget>()
    
    @IBOutlet weak var budgetTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        registerCustomCell()
        addBudgetNavigationButton ()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        addBudgets()
    }
    
    func addBudgets () {
        let realmManager = RealmManager()
        budgetList.removeAll()
        
        let budgets = realmManager.getAllBudgets()!
        self.budgetList.append(objectsIn: budgets)
        
        budgetTableView.reloadData()
    }
    
    func registerCustomCell() {
        let nib = UINib(nibName: R.nib.budgetTableViewCell.name, bundle: nil)
        budgetTableView.register(nib, forCellReuseIdentifier: R.nib.budgetTableViewCell.name)
    }
    
    func addBudgetNavigationButton() {
        let addNavigationButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addBudgetAction(sender:)))
        
        navigationItem.rightBarButtonItem = addNavigationButton
    }
    
    @objc func addBudgetAction (sender:UIBarButtonItem) {
        if let addBudgetViewController = storyboard?.instantiateViewController(identifier: R.storyboard.main.addBudgetViewController.identifier) as? AddBudgetViewController {
            addBudgetViewController.delegate = self
            navigationController?.pushViewController(addBudgetViewController, animated: true)
        }
        
    }
}

extension BudgetViewController: AddBudgetViewControllerProtocol {
    func addBudget(budget: Budget) {
        let realmManager = RealmManager()
        
        realmManager.insertBudget(budget: budget)
        
        budgetList.append(budget)
            
        navigationController?.popViewController(animated: true)
            budgetTableView.reloadData()
    }
    
    func modifyBudget (budget: Budget, name:String) {
        let realmManager = RealmManager()
        
        realmManager.modifyBudget(budget: budget, name: name)
        
        navigationController?.popViewController(animated: true)
            budgetTableView.reloadData()
    }
    
}

extension BudgetViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return budgetList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: R.nib.budgetTableViewCell.name)  as? BudgetTableViewCell else {
            let cell = UITableViewCell()
            cell.textLabel?.text = "NO EXISTE"
            return cell
        }
        
        let budget = budgetList[indexPath.row]
        cell.SetupCell(budget: budget)
        if budget.amount <= 0 {
            cell.backgroundColor = .red
        }
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let budget = self.budgetList[indexPath.row]
        
        if let addExpensesViewController = self.storyboard?.instantiateViewController(identifier: R.storyboard.main.addExpensesViewController.identifier) as? AddExpensesViewController
        {
            addExpensesViewController.budget = budget
            addExpensesViewController.delegate = self
            self.navigationController?.pushViewController(addExpensesViewController, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
    let delete = UITableViewRowAction(style: .destructive, title: "Eliminar") { (action, indexPath) in
        // delete item at indexPath
        let realmManager = RealmManager()
        let budget = self.budgetList[indexPath.row]
        
        realmManager.removeBudget(budget: budget)
        self.budgetList.remove(at: indexPath.row)
            
        tableView.beginUpdates()
        tableView.deleteRows(at: [indexPath], with: .fade)
        tableView.endUpdates()
        
    }
        
    delete.backgroundColor = .red

    let edit = UITableViewRowAction(style: .normal, title: "Editar") { (action, indexPath) in
        // share item at indexPath
        let budget = self.budgetList[indexPath.row]
        
        if let addBudgetViewController = self.storyboard?.instantiateViewController(identifier: R.storyboard.main.addBudgetViewController.identifier) as? AddBudgetViewController
            {
                addBudgetViewController.budget = budget
                addBudgetViewController.delegate = self
                self.navigationController?.pushViewController(addBudgetViewController, animated: true)
            }
        }

        edit.backgroundColor = UIColor.blue

        return [delete, edit]
    }
}

extension BudgetViewController: AddExpensesViewControllerProtocol {
    func addTransaction(budget: Budget, transaction: Transaction) {
        let realmManager = RealmManager()
        
        realmManager.addTransactionToBudget(budget: budget, transaction: transaction)
        
        navigationController?.popViewController(animated: true)
            budgetTableView.reloadData()
    }
    
    
}
