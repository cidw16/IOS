//
//  AlamofireHelper.swift
//  RestApiExample
//
//  Created by Cesar Brenes on 4/18/20.
//  Copyright © 2020 VeuxLabs. All rights reserved.
//

import Foundation
import Alamofire

class AlamofireHelper {
    
    static let timeOut = 30.0
    
    static func createRequest(parameters: Parameters?, requestPath: String, httpMethod: HTTPMethod) -> URLRequest? {
        guard let requestURL = URL(string: requestPath) else {
            return nil
        }
        var request = URLRequest(url: requestURL)
        request.httpMethod = httpMethod.rawValue
        request.timeoutInterval = timeOut
        if let parameters = parameters {
            request.httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: [])
            
        }
        return request
        
    }
}

