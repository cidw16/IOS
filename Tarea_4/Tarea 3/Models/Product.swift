//
//  Product.swift
//  Tarea 3
//
//  Created by user166916 on 3/27/20.
//  Copyright © 2020 user166916. All rights reserved.
//

import Foundation
import RealmSwift

class Product: Object {
    @objc dynamic var identifier = NSUUID().uuidString
    @objc dynamic var productName = ""
    @objc dynamic var quantity = 0
    @objc dynamic var image = ""
    
    @objc dynamic var date = Date()
    
    convenience init(productName: String, quantity: Int, imageName: String){
        self.init()
        self.productName = productName
        self.quantity = quantity
        self.image = imageName
    }
    
    override static func primaryKey() -> String? {
        return "identifier"
    }
    
    override static func indexedProperties() -> [String] {
        return ["identifier"]
    }
}
