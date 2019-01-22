//
//  WeatherData.swift
//  WeatherApp
//
//  Created by Jabeen's MacBook on 1/21/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct WeatherData: Codable {
    let response: [ResponseWrapper]
}

struct ResponseWrapper: Codable {
    let periods: [Forecast]
}

struct Forecast: Codable {
   
    let dateTimeISO: String
    let maxTempC: Int
    let maxTempF: Int
    let minTempC: Int
    let minTempF: Int
    let sunriseISO: String
    let sunsetISO: String
    let windSpeedMaxKPH: Int
    let windSpeedMaxMPH: Int
    let weather: String
    let icon: String
    let precipMM: Int
    let precipIN: Int
    
}
