//
//  DetailedViewController.swift
//  WeatherApp
//
//  Created by Aleksandra Korolczuk on 2017-09-20.
//  Copyright © 2017 Derrick Park. All rights reserved.
//

import UIKit

class DetailedViewController: UIViewController {
    var city: City!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.yellow
        
        let imageView = UIImageView(frame: CGRect(x: 100, y: 100, width: 50, height: 50))
        imageView.image = city.rainfall
        
        view.addSubview(imageView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    


}
