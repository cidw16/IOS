//
//  RealmManager.swift
//  Tarea 4
//
//  Created by user166916 on 4/1/20.
//  Copyright © 2020 user166916. All rights reserved.
//

import Foundation
import RealmSwift

class RealmManager {
    
    func insertProduct (product: Product) {
        do {
            let realm = try Realm()
            try realm.write {
                realm.add(product, update: .all)
            }
        } catch {
            print("Realm falló por alguna razón")
        }
    }
    
    func removeProdut (product: Product) {
        do {
            let realm = try Realm()
            try realm.write {
                realm.delete(product)
            }
        } catch let error as NSError{
            print (error.description)
        }
    }
    
    //Obtiene todas las categorias de forma syncrona
    func getAllProducts() -> Results<Product>? {
        let realm = try? Realm()
        return realm?.objects(Product.self)
    }
    
    //Obtiene todas las categorias de forma asyncrona
    func getAllProducts(completionHandler:(_ categories: Results<Product>?) -> Void) {
        completionHandler(getAllProducts())
    }}
