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
    public var dateFormattedDateTimeISO: String {
        let isoDateFormatter = ISO8601DateFormatter()
        var formattedDate = dateTimeISO
        if let date = isoDateFormatter.date(from: dateTimeISO) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMM D, YYYY"
            formattedDate = dateFormatter.string(from: date)
        }
        return formattedDate
    }
    public var dateTime: Date {
        let isoFormatter = ISO8601DateFormatter()
        var formattedDate = Date()
        if let date = isoFormatter.date(from: dateTimeISO) {
            formattedDate = date
        }
        return formattedDate
    }
    let maxTempC: Int
    let maxTempF: Int
    let minTempC: Int
    let minTempF: Int
    let sunriseISO: String
    public var dateFormattedSunriseISO: String {
        let isoDateFormatter = ISO8601DateFormatter()
        var formattedDate = sunriseISO
        if let date = isoDateFormatter.date(from: sunriseISO) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "HH:mm:ss"
            formattedDate = dateFormatter.string(from: date)
        }
        return formattedDate
    }
    public var dateSunrise: Date {
        let isoFormatter = ISO8601DateFormatter()
        var formattedDate = Date()
        if let date = isoFormatter.date(from: dateTimeISO) {
            formattedDate = date
        }
        return formattedDate
    }
    let sunsetISO: String
    public var dateFormattedSunsetISO: String {
        let isoDateFormatter = ISO8601DateFormatter()
        var formattedDate = sunsetISO
        if let date = isoDateFormatter.date(from: sunsetISO) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "HH:mm:ss"
            formattedDate = dateFormatter.string(from: date)
        }
        return formattedDate
    }
    public var date: Date {
        let isoFormatter = ISO8601DateFormatter()
        var formattedDate = Date()
        if let date = isoFormatter.date(from: dateTimeISO) {
            formattedDate = date
        }
        return formattedDate
    }
    let windSpeedMaxKPH: Int
    let windSpeedMaxMPH: Int
    let weather: String
    let icon: String
    let precipMM: Double
    let precipIN: Double


}


