//
//  ViewController.swift
//  WeatherApp
//
//  Created by Alex Paul on 1/17/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var selectedCity = "New York"
    var weatherForecast = [Forecast]() {
        didSet {
            DispatchQueue.main.async {
                self.weatherCollectionView.reloadData()
            }
        }
    }
    
    

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
    getData(string: "11429")
  }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let selectedCell = sender as? UICollectionViewCell,
        let indexPath = weatherCollectionView.indexPath(for: selectedCell),
            let destination = segue.destination as? DetailedViewController else { return }
        destination.selectedCity = selectedCity
        destination.forecastSelected = weatherForecast[indexPath.row]
        
    }
    
    
    
    
    
    
    
    
    func getData(string: String) { // string = zipcode
        AerisAPIClient.searchZipcode(keyword: string) { (appError, weatherData) in
            if let appError = appError {
                print(appError.errorMessage())
            } else if let weatherData = weatherData {
                self.weatherData = weatherData
            dump(weatherData)
            }
        }
        
        }
    }

extension ViewController: UICollectionViewDataSource {
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
    
    
}
