//
//  DataManager.swift
//  WeatherApp
//
//  Created by Jabeen's MacBook on 2/14/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import Foundation

final class ImageDataManager {
    private static let filename = "WeatherList.plist"
    private static var weatherPhoto = [Favorites]()
    
    
    static func savePhoto() {
        let path = DataPersistenceManager.filepathToDocumentsDirectory(filename: filename)
        do {
            let data = try PropertyListEncoder().encode(weatherPhoto)
            
            try data.write(to: path, options: Data.WritingOptions.atomic)
        } catch {
            print("property list encoding error: \(error)")
        }
    }
    
    
    static func getPhoto() -> [Favorites] {
        let path = DataPersistenceManager.filepathToDocumentsDirectory(filename: filename).path
        
        if FileManager.default.fileExists(atPath: path) {
            if let data = FileManager.default.contents(atPath: path) {
                do {
                    weatherPhoto = try PropertyListDecoder().decode([Favorites].self, from: data)
                } catch {
                    print("property list decoding error: \(error)")
                }
            }else {
                print("getPhotoJournal - data is nil")
            }
        } else {
            print("\(filename) does not exist")
        }
        return weatherPhoto
    }
    
    static func addPhoto(item: Favorites) {
        weatherPhoto.append(item)
        savePhoto()
    }
}



