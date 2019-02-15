//
//  FavoritesViewController.swift
//  WeatherApp
//
//  Created by Jabeen's MacBook on 1/21/19.
//  Copyright © 2019 Pursuit. All rights reserved.
//

import UIKit

class FavoritesViewController: UIViewController {

    @IBOutlet weak var imageTableview: UITableView!
    
    var photos = ImageDataManager.getPhoto(){
        didSet {
            DispatchQueue.main.async {
                self.imageTableview.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageTableview.dataSource = self
        imageTableview.delegate = self
       
    }
    

  

}

extension FavoritesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FavsCell", for: indexPath) as? FavsCell else {
            fatalError("Favs Cell error")
        }
    let weatherPhoto = photos[indexPath.row]
        if let image = UIImage(data: weatherPhoto.image) {
            cell.favoriteImageView.image = image
        }
    return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
    }
    
    
    
}
