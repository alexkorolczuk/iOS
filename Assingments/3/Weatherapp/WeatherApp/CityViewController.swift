//
//  CityViewController.swift
//  WeatherApp
//
//  Created by Aleksandra Korolczuk on 2017-09-20.
//  Copyright © 2017 Derrick Park. All rights reserved.
//

import UIKit

class CityViewController: UIViewController {
    
    let detailedViewController = DetailedViewController()
    var city: City!
    
     let addCityBarButton = UIBarButtonItem()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let addCityBarButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewObject))
        self.navigationItem.rightBarButtonItem = addCityBarButton
        
        
        view.backgroundColor = UIColor.lightGray
        let location = UILabel(frame: CGRect(x: view.bounds.width / 2 - 50, y: view.bounds.height / 2, width: 200, height: 400))
        location.backgroundColor = UIColor.darkGray
            location.text = city.city_name
        
        let showMore = UIButton(frame: CGRect(x: view.bounds.width / 2 - 50, y: view.bounds.height / 3, width: 100, height: 100))
        showMore.backgroundColor = UIColor.red
        showMore.setTitle("Show details",for: .normal)
        showMore.addTarget(self, action: #selector(showWeatherDetails), for: .touchUpInside)

        
        
        view.addSubview(showMore)
        view.addSubview(location)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    func showWeatherDetails() {
        let newDetailedViewController = DetailedViewController()
        newDetailedViewController.city = self.city
        self.navigationController?.pushViewController(newDetailedViewController, animated: true)
    }

    
    func addNewObject(){
        let newCity  = UIViewController()
        newCity.modalPresentationStyle = .popover
        newCity.popoverPresentationController?.sourceView = view
        newCity.popoverPresentationController?.barButtonItem = addCityBarButton
        self.navigationController?.pushViewController(newCity, animated: true)

        
    }

    
    
    
}
