//
//  DetailedViewController.swift
//  WeatherApp
//
//  Created by Jabeen's MacBook on 1/21/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class DetailedViewController: UIViewController {

    var selectedCity: String!
    var forecastSelected: Forecast!
    
   
    @IBOutlet weak var forecastAndDate: UILabel!
    @IBOutlet weak var cityImage: UIImageView!
    @IBOutlet weak var weatherDescription: UILabel!
    @IBOutlet weak var highTemp: UILabel!
    @IBOutlet weak var lowTemp: UILabel!
    @IBOutlet weak var sunrise: UILabel!
    @IBOutlet weak var sunset: UILabel!
    @IBOutlet weak var windspeed: UILabel!
    @IBOutlet weak var precipitation: UILabel!
    @IBOutlet weak var favButton: UIBarButtonItem!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
         
        ImageAPIClient.searchImages(city: selectedCity) { (appError, image) in
            if let appError = appError {
                print(appError.errorMessage())
            } else if let images = image {
                self.image = images
            }
        }
      
    forecastAndDate.text = "Weather forecast for \(selectedCity!)" + " for \(forecastSelected.dateFormattedDateTimeISO)"
    weatherDescription.text = forecastSelected.weather
        highTemp.text = "High: \(forecastSelected.maxTempC) ºC"
        lowTemp.text = "Low: \(forecastSelected.minTempC) ºC"
        sunrise.text = "Sunrise: \(forecastSelected.dateFormattedSunriseISO)"
        sunset.text = "Sunset: \(forecastSelected.dateFormattedSunsetISO)"
        windspeed.text = "Windspeed: \(forecastSelected.windSpeedMaxKPH) KPH"
        precipitation.text = "Precipitation: \(forecastSelected.precipIN)"
    }
    
    
    var image = [ImageWrapper]() {
        didSet {
            let randomImage = Int.random(in: 0..<image.count)
            ImageHelper.fetchImage(urlString: image[randomImage].largeImageURL) { (error, image) in
                if let error = error {
                    print(error.errorMessage)
                } else if let images = image {
                    self.cityImage.image = image
                }
            }
        }
    }
    
    private func showAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default) { alert in }
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func FavButtonPressed(_ sender: UIBarButtonItem) {
        if let image  = cityImage.image {
            let date = Date()   // so that when you fav an image the newest favorited image appears at the top
            let isoDateFormatter = ISO8601DateFormatter()
            isoDateFormatter.formatOptions = [.withFullDate, .withFullTime, .withInternetDateTime, .withTimeZone, .withDashSeparatorInDate]
        
        let timestamp = isoDateFormatter.string(from: date)
            guard let image = image.jpegData(compressionQuality: 0.5) else {
                return print(" no image ")
            }
        let favorite = Favorites.init(createdTime: timestamp, image: image)
            if let weatherPhoto = forecastSelected {
                ImageDataManager.addPhoto(item: favorite)
                showAlert(title: "Save", message: "Your image has been saved!")
            }
        
        
        }
    }
    
    
    

}




