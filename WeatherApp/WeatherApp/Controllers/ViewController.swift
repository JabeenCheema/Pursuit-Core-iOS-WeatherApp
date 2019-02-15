//
//  ViewController.swift
//  WeatherApp
//
//  Created by Alex Paul on 1/17/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
   var selectedCity = String()

    @IBOutlet weak var weatherCollectionView: UICollectionView!
    @IBOutlet weak var zipcodetextField: UITextField!
    @IBOutlet weak var forecastLabel: UILabel!
    
    var weatherData = [Forecast]() {
        didSet {
            DispatchQueue.main.async {
                self.weatherCollectionView.reloadData()
            }
        }
    }
    override func viewDidLoad() {
    super.viewDidLoad()
    weatherCollectionView.dataSource = self
    zipcodetextField.delegate = self
    getData(string: "11429")
  }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let selectedCell = sender as? UICollectionViewCell,
        let indexPath = weatherCollectionView.indexPath(for: selectedCell),
            let destination = segue.destination as? DetailedViewController else { return }
        destination.selectedCity = selectedCity
        destination.forecastSelected =  weatherData[indexPath.row]
        
    }
    
    
    
    
    
    
    
    
    func getData(string: String) { // string = zipcode
        WeatherAPIClient.searchZipcode(keyword: string) { (appError, weatherData) in
            if let appError = appError {
                print(appError.errorMessage())
            } else if let weatherData = weatherData {
                self.weatherData = weatherData
            dump(weatherData)
            }
        }
        
        }
    }

extension ViewController: UICollectionViewDataSource, UITextFieldDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return weatherData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = weatherCollectionView.dequeueReusableCell(withReuseIdentifier: "WeatherCell", for: indexPath) as? WeatherCell else { return UICollectionViewCell() }
        let currentForecast = weatherData[indexPath.row]
        cell.Date.text = currentForecast.dateTimeISO
        cell.highTemp.text = "\(currentForecast.maxTempF)"
        cell.lowTemp.text = "\(currentForecast.minTempF)"
        cell.weatherIcon.image = UIImage.init(named: currentForecast.icon)
        
        
        
        return cell
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let text = textField.text{
            ZipCodeHelper.getLocationName(from: text) { (error, location) in
                if let error = error {
                    print("No location found")
                } else if let location = location {
                    self.forecastLabel.text = "Weather forecast for \(location)"
                    self.selectedCity = location
                    self.getData(string: text)
                }
            }
            
        }
        
        return true
    }
    
}
