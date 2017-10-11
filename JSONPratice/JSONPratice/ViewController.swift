//
//  ViewController.swift
//  JSONPratice
//
//  Created by Aleksandra Korolczuk on 2017-09-28.
//  Copyright © 2017 Aleksandra Korolczuk & Momoko Nakada. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    var weather = DataModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weather.downloadData {
            self.updateUI()
        }
    
    }
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func updateUI() {
        dateLabel.text = weather.date
        tempLabel.text = "\(weather.temp)"
        locationLabel.text = weather.location
        weatherLabel.text = weather.weather
        weatherImage.image = UIImage(named: weather.weather)
    }
    
    
}

