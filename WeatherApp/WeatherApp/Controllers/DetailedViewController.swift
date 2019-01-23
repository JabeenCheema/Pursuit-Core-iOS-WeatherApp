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

      
    }
    


}




