//
//  Transaction.swift
//  ProyectoFinal
//
//  Created by user166916 on 5/1/20.
//  Copyright © 2020 user166916. All rights reserved.
//

import Foundation
import RealmSwift

class Transaction: Object {
    @objc dynamic var identifier = NSUUID().uuidString
    @objc dynamic var tranDescription = ""
    @objc dynamic var amount = 0.0
    
    let budget = LinkingObjects(fromType: Budget.self, property: "transactions")
    
    convenience init(description: String, amount: Double){
        self.init()
        
        self.tranDescription = description
        self.amount = amount
    }
    
    override static func primaryKey() -> String? {
        return "identifier"
    }
    
    override static func indexedProperties() -> [String] {
        return ["identifier"]
    }
}
