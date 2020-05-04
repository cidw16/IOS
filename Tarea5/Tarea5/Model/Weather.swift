//
//  Weather.swift
//  Tarea5
//
//  Created by user166916 on 5/3/20.
//  Copyright © 2020 user166916. All rights reserved.
//

import Foundation

struct WeatherKeys {
    static let dt = "dt"
    static let sunrise = "sunrise"
    static let sunset = "sunset"
    static let temp = "temp"
    static let feels_like = "feels_like"
    static let pressure = "pressure"
    static let humidity = "humidity"
    static let dew_point = "dew_point"
    static let uvi = "uvi"
    static let clouds =  "clouds"
    static let visibility = "visibility"
    static let wind_speed = "wind_speed"
    static let wind_deg = "wind_deg"
}

struct Weather {
    var dt: Double
    var sunrise: Double
    var sunset: Double
    var temp: Double
    var feels_like: Double
    var pressure : Double
    var humidity: Double
    var dew_point: Double
    var uvi: Double
    var clouds: Double
    var visibility: Double
    var wind_speed: Double
    var wind_deg: Double
}

extension Weather {
    init(dictionary: [String: Any]) {
        dt = dictionary[WeatherKeys.dt] as? Double ?? 0.0
        sunrise = dictionary[WeatherKeys.sunrise] as? Double ?? 0.0
        sunset = dictionary[WeatherKeys.sunset] as? Double ?? 0.0
        temp = dictionary[WeatherKeys.temp] as? Double ?? 0.0
        feels_like = dictionary[WeatherKeys.feels_like] as? Double ?? 0.0
        pressure = dictionary[WeatherKeys.pressure] as? Double ?? 0.0
        humidity = dictionary[WeatherKeys.humidity] as? Double ?? 0.0
        dew_point = dictionary[WeatherKeys.dew_point] as? Double ?? 0.0
        uvi = dictionary[WeatherKeys.uvi] as? Double ?? 0.0
        clouds = dictionary[WeatherKeys.clouds] as? Double ?? 0.0
        visibility = dictionary[WeatherKeys.visibility] as? Double ?? 0.0
        wind_speed = dictionary[WeatherKeys.wind_speed] as? Double ?? 0.0
        wind_deg = dictionary[WeatherKeys.wind_deg] as? Double ?? 0.0
    }
}


