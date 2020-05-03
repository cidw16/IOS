//
//  RealmManager.swift
//  ProyectoFinal
//
//  Created by user166916 on 4/28/20.
//  Copyright © 2020 user166916. All rights reserved.
//

import Foundation
import RealmSwift

class RealmManager {
    
    func modifyBudget (budget: Budget, name:String) {
        do {
            let realm = try Realm()
            try realm.write {
                budget.name = name
            }
        } catch {
            print("Realm falló por alguna razón")
        }
    }
    
    func addTransactionToBudget (budget: Budget, transaction: Transaction) {
        do {
            let realm = try Realm()
            try realm.write {
                budget.transactions.append(transaction)
                budget.amount += transaction.amount
            }
        } catch {
            print("Realm falló por alguna razón")
        }
    }
    
    func insertBudget (budget: Budget) {
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(budget, update: .all)
            }
        } catch {
            print("Realm falló por alguna razón")
        }
    }
    
    func removeBudget (budget: Budget) {
        do {
            let realm = try Realm()
            try realm.write {
                realm.delete(budget)
            }
        } catch let error as NSError{
            print (error.description)
        }
    }
    
    func removeAllBudgets () {
        do {
            let realm = try Realm()
            try realm.write {
                realm.deleteAll()
            }
        } catch let error as NSError{
            print (error.description)
        }
    }
    
    func removeTransactionFromBudget (budget:Budget, transactionIndex: Int) {
        do {
            let realm = try Realm()
            try realm.write {
                budget.amount -= budget.transactions[transactionIndex].amount
                budget.transactions.remove(at: transactionIndex)
            }
        } catch let error as NSError{
            print (error.description)
        }
    }
    
    //Obtiene todas las categorias de forma syncrona
    func getAllBudgets() -> Results<Budget>? {
        let realm = try? Realm()
        return realm?.objects(Budget.self)
    }
    
    //Obtiene todas las categorias de forma asyncrona
    func getAllBudgets(completionHandler:(_ categories: Results<Budget>?) -> Void) {
        completionHandler(getAllBudgets())
    }
}
