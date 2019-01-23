//
//  AerisAPIClient.swift
//  WeatherApp
//
//  Created by Jabeen's MacBook on 1/22/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

final class AerisAPIClient {
        static func searchZipcode(keyword: String, completionHandler: @escaping (AppError?, [Forecast]?) -> Void) {
        let urlString = "http://api.aerisapi.com/forecasts/\(keyword)?client_id=\(SecretKeys.weatherID)&client_secret=\(SecretKeys.weatherKey)"
            
            NetworkHelper.shared.performDataTask(endpointURLString: urlString , httpMethod: "GET", httpBody: nil) { (appError, data, httpResponse) in
                if let appError = appError {
                    completionHandler(appError, nil)
                }
                guard let response = httpResponse,
                    (200...299).contains(response.statusCode) else {
                        let statusCode = httpResponse?.statusCode ?? -999
                        completionHandler(AppError.badStatusCode(String(statusCode)), nil)
                        return
                }
                if let data = data {
                    do {
                        let weatherdata = try JSONDecoder().decode(WeatherData.self, from: data).response.first?.periods
                        dump(weatherdata)
                        completionHandler(nil, weatherdata)
                    } catch {
                        completionHandler(AppError.decodingError(error), nil)
                    }
                }
            }
        }
}
