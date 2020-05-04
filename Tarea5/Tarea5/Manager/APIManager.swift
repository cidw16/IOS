//
//  APIManager.swift
//  RestApiExample
//


import Foundation
import Alamofire


class APIManager {
    
    static let rootURL = "https://api.openweathermap.org/data/2.5/onecall?lat=9.83228027673567&lon=-83.91017021487139&appid=308a78b4a0e54e1b8a8dbcb781f4179b"
    
    class func getWeather(completionHandler: @escaping (_ error: WeatherAPIError?, _ weather: Weather?) -> Void) {
        guard let isNetWorkReachable = NetworkReachabilityManager()?.isReachable else {
            completionHandler(.noInternetConnection, nil)
            return
        }
        if isNetWorkReachable {
            makeRequestToGetWeatherToTheAPI(completionHandler: completionHandler)
        } else {
            completionHandler(.noInternetConnection, nil)
        }
    }
    
    private class func makeRequestToGetWeatherToTheAPI(completionHandler: @escaping(_ error: WeatherAPIError?, _ memes: Weather?) -> Void) {
        guard let request = AlamofireHelper.createRequest(parameters: nil, requestPath: APIManager.rootURL, httpMethod: .get) else {
            return completionHandler(.invalidURL, nil)
        }
        AF.request(request).validate().responseJSON { (response) in
            switch response.result {
            case .success:
                guard let jsonAnswer = response.value as? [String: Any], let weatherData = jsonAnswer["current"] as? [String: Any]  else {
                    completionHandler(.wrongAnswer, nil)
                    return
                }
                var weather = Weather(dictionary: weatherData)
                
                completionHandler(nil, weather)
            case .failure:
                completionHandler(.serverError, nil)
            }
        }
        
    }
}

enum WeatherAPIError {
    case noInternetConnection
    case wrongAnswer
    case serverError
    case invalidURL
}

