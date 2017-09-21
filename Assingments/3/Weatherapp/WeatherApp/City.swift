//
//  City.swift
//  WeatherApp
//
//  Created by Aleksandra Korolczuk on 2017-09-20.
//  Copyright © 2017 Derrick Park. All rights reserved.
//

import UIKit

class City: NSObject {
    
    var city_name: String
    var temperature: Int
    var rainfall: UIImage
    
    
    init(city_name: String, temperature: Int, rainfall: UIImage) {
        self.city_name = city_name
        self.temperature = temperature
        self.rainfall = rainfall
    }
    
}
