//
//  DateFormatter.swift
//  Tarea 3
//
//  Created by user166916 on 3/28/20.
//  Copyright © 2020 user166916. All rights reserved.
//

import Foundation

extension Date {
    
    func getFormatted(dateStyle: DateFormatter.Style, timeStyle: DateFormatter.Style) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale.current
        formatter.dateStyle = dateStyle
        formatter.timeStyle = timeStyle
        let localizedDate = formatter.string(from: self)
        return localizedDate
    }
}

extension TimeInterval{

        func stringFromTimeInterval() -> String {

            var result = ""
            let time = NSInteger(self)

            let seconds = time % 60
            let minutes = (time / 60) % 60
            let hours = (time / 3600)
            let days = (time / 3600) / 24

            if hours < 24 {
            
                result = String(format: "%0.2d : %0.2d : %0.2d",hours,minutes,seconds)
            }
            
            else {
                result = String(format: "%0d d" ,days)
            }
            return result

        }
}

