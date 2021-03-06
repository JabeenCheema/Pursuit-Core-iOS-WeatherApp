//
//  Date + Extension.swift
//  WeatherApp
//
//  Created by Jabeen's MacBook on 2/14/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

extension Date {
    // get an ISO timestamp
    static func getISOTimestamp() -> String {
        let isoDateFormatter = ISO8601DateFormatter()
        let timestamp = isoDateFormatter.string(from: Date())
        return timestamp
    }
}
