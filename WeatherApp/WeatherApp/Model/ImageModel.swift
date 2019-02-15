//
//  ImageModel.swift
//  WeatherApp
//
//  Created by Jabeen's MacBook on 2/14/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct ImageData: Codable {
    let hits: [ImageWrapper]
}

struct ImageWrapper: Codable {
    let largeImageURL: String
}
