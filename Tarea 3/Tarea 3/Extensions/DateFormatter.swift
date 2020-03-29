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
