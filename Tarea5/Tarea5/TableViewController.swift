//
//  TableViewController.swift
//  Tarea5
//
//  Created by user166916 on 5/3/20.
//  Copyright © 2020 user166916. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    
    @IBOutlet weak var lblDT: UILabel!
    
    @IBOutlet weak var lblSunrise: UILabel!
    
    @IBOutlet weak var lblSunset: UILabel!
    
    @IBOutlet weak var lblTemp: UILabel!
    
    @IBOutlet weak var lblFeelsLike: UILabel!
    
    @IBOutlet weak var lblPressure: UILabel!
    
    @IBOutlet weak var lblHumidity: UILabel!
    
    @IBOutlet weak var lblDewPoint: UILabel!
    
    @IBOutlet weak var lblUvi: UILabel!
    
    @IBOutlet weak var lblClouds: UILabel!
    
    @IBOutlet weak var lblVisibility: UILabel!
    
    @IBOutlet weak var lblWindSpeed: UILabel!
    
    @IBOutlet weak var lblWindDeg: UILabel!
    
    var weather: Weather?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        getWeather()
        
        
    }
    
    func getWeather() {
        APIManager.getWeather { (error, weather) in
            if let error = error {
                print (error)
            }
            else if let weatherRs = weather {
                self.weather = weatherRs
                
                self.lblDT.text = String(format:"%.1f",weather!.dt)
                self.lblSunrise.text = String(format:"%.1f",weather!.sunrise)
                self.lblSunset.text = String(format:"%.1f",weather!.sunset)
                self.lblTemp.text = String(format:"%.1f",weather!.temp)
                self.lblFeelsLike.text = String(format:"%.1f",weather!.feels_like)
                self.lblPressure.text = String(format:"%.1f",weather!.pressure)
                self.lblHumidity.text = String(format:"%.1f",weather!.humidity)
                self.lblDewPoint.text = String(format:"%.1f",weather!.dew_point)
                self.lblUvi.text = String(format:"%.1f",weather!.uvi)
                self.lblClouds.text = String(format:"%.1f",weather!.clouds)
                self.lblVisibility.text = String(format:"%.1f",weather!.visibility)
                self.lblWindSpeed.text = String(format:"%.1f",weather!.wind_speed)
                self.lblWindDeg.text = String(format:"%.1f",weather!.wind_deg)
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 13
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
