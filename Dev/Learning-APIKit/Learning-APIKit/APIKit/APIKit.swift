//
//  APIKit.swift
//  Learning-APIKit
//
//  Created by Weida Xu on 2017/8/28.
//  Copyright © 2017年 Weida Xu. All rights reserved.
//

import Foundation

import APIKit

import Himotoki

protocol WeatherRequest: Request {
    
}

extension WeatherRequest {
    var baseURL: URL {
        return URL(string: "http://weather.livedoor.com/forecast/webservice/json")!
    }
}

extension WeatherRequest where Response: Decodable {
    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> Response {
        return try Response.decodeValue(object)
    }
}


final class WeatherAPI {
    struct GetWeatherRequest: WeatherRequest {
        typealias Response = GetWeatherResponse
        
        var method: HTTPMethod {
            return .get
        }
        
        var path: String {
            return "/v1"
        }
        var parameters: Any? {
            return [
                "city": "016010"
            ]
        }
    }
}

struct GetWeatherResponse: Decodable {
    let pref: String
    let city: String
    
    static func decode(_ e: Extractor) throws -> GetWeatherResponse {
        return try GetWeatherResponse(
            pref: e.value(["location", "prefecture"]),
            city: e.value(["location", "city"]))
    }
}

