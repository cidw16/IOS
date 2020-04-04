//
//  RealmManager.swift
//  quiz#3
//
//  Created by user166916 on 4/4/20.
//  Copyright © 2020 user166916. All rights reserved.
//

import Foundation
import RealmSwift

class RealManager {
func insertProduct (tagNumber: Int, name: String, quantity: Int) {
    let item = Item (tagNumber: tagNumber, name: name, quantity: quantity)
    do {
        let realm = try Realm()
        try realm.write {
            realm.add(item, update: .all)
        }
    } catch {
        print("Realm falló por alguna razón")
    }
}

func removeProdut (item: Item) {
    do {
        let realm = try Realm()
        try realm.write {
            realm.delete(item)
        }
    } catch {
        print ("fallo")
    }
}

//Obtiene todas las categorias de forma syncrona
func getAllCategories() -> Results<Item>? {
    let realm = try? Realm()
    return realm?.objects(Item.self)
}

//Obtiene todas las categorias de forma asyncrona
func getAllCategories(completionHandler:(_ items: Results<Item>?) -> Void) {
    completionHandler(getAllCategories())
}
}
