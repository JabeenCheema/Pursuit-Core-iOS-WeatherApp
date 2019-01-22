//
//  AerisAPIClient.swift
//  WeatherApp
//
//  Created by Jabeen's MacBook on 1/22/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

final class AerisAPIClient {
        static func searchPodcast(keyword: String, completionHandler: @escaping (AppError?, [WeatherData]?) -> Void) {
            NetworkHelper.shared.performDataTask(endpointURLString: "https://api.aerisapi.com/forecasts/NewYork, USA?format=json&filter=day&limit=7&client_id=\(SecretKeys.weatherKey)", httpMethod: "GET", httpBody: nil) { (appError, data, httpResponse) in
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
                        let weatherdata = try JSONDecoder().decode(WeatherData.self, from: data)
                        completionHandler(nil, [weatherdata])
                    } catch {
                        completionHandler(AppError.decodingError(error), nil)
                    }
                }
            }
        }
}
