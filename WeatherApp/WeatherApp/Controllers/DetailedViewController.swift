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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(selectedCity)
        print(forecastSelected)
      
    forecastAndDate.text = "Weather forecast for \(selectedCity!)" + " for \(forecastSelected.dateTimeISO)"
    
    weatherDescription.text = forecastSelected.weather
        
        highTemp.text = "High: \(forecastSelected.maxTempC) ºC"
        lowTemp.text = "Low: \(forecastSelected.minTempC) ºC"
        sunrise.text = "Sunrise: \(forecastSelected.sunriseISO)"
        sunset.text = "Sunset: \(forecastSelected.sunsetISO)"
        windspeed.text = "Windspeed: \(forecastSelected.windSpeedMaxKPH) KPH"
        precipitation.text = "Precipitation: \(forecastSelected.precipIN)"
    }
    

    
    
    

}




