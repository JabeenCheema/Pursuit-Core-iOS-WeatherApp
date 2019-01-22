//
//  FavoritesModel.swift
//  WeatherApp
//
//  Created by Jabeen's MacBook on 1/22/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

struct Favorites: Codable {
    let hits: [HitsWrapper]
    
}

struct HitsWrapper: Codable {
    let largeImageURL: String
}
