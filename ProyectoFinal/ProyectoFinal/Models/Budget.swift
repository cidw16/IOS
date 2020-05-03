//
//  Budget.swift
//  ProyectoFinal
//
//  Created by user166916 on 4/26/20.
//  Copyright © 2020 user166916. All rights reserved.
//

import RealmSwift

class Budget: Object {
    @objc dynamic var identifier = NSUUID().uuidString
    @objc dynamic var name = ""
    @objc dynamic var periodicity = "Weekly"
    @objc dynamic var startDate = Date()
    @objc dynamic var initialAmount = 0.0
    @objc dynamic var amount = 0.0
    
    let transactions = List<Transaction>()
    
    convenience init(name: String, periodicity: String, startDate: Date, initialAmount:Double, amount: Double){
        self.init()
        
        self.name = name
        self.periodicity = periodicity
        self.startDate = startDate
        self.amount = amount
    }
    
    override static func primaryKey() -> String? {
        return "identifier"
    }
    
    override static func indexedProperties() -> [String] {
        return ["identifier"]
    }
}
