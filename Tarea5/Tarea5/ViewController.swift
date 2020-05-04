//
//  ViewController.swift
//  Tarea5
//
//  Created by user166916 on 5/3/20.
//  Copyright © 2020 user166916. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        getWeather()
    }

    func getWeather() {
        APIManager.getWeather { (error, weather) in
            if let error = error {
            //self.handleError(error: error)
                print ("error")
            }
            else if let weatherRs = weather {
                print("Entro")
            }
        }
    }

}

