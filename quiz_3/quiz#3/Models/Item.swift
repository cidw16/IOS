//
//  Item.swift
//  quiz#3
//
//  Created by user166916 on 4/4/20.
//  Copyright © 2020 user166916. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var identifier = NSUUID().uuidString
    @objc dynamic var tagNumber = 0
    @objc dynamic var name = ""
    @objc dynamic var purchaseDate = Date()
    @objc dynamic var quantity = 0
    
    convenience init(tagNumber: Int, name: String, quantity: Int){
        self.init()
        
        self.tagNumber = tagNumber
        self.name = name
        self.quantity = quantity
    }
    
    override static func primaryKey() -> String? {
        return "identifier"
    }
    
    override static func indexedProperties() -> [String] {
        return ["identifier"]
    }}
