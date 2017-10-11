//
//  ViewController.swift
//  DinstanceFromHomoe
//
//  Created by Aleksandra Korolczuk on 2017-09-29.
//  Copyright © 2017 Aleksandra Korolczuk. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    var loc = Location()
//    var locationManager: CLLocationManager?
//    var startLocation: CLLocation?
//    var homeLocation = CLLocation(latitude: 49.2675681, longitude: -123.0569122)
//
//

    override func viewDidLoad() {
        print("\(loc.locationManager.location?.coordinate.latitude)")
//        super.viewDidLoad()
//        locationManager = CLLocationManager()
//        locationManager?.delegate = self
//        locationManager?.desiredAccuracy = kCLLocationAccuracyBest
//        locationManager?.requestWhenInUseAuthorization()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
    
//    extension ViewController:CLLocationManagerDelegate {
//        
//        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//            if startLocation == nil {
//                startLocation = locations.first
//            } else {
//                guard let latest = locations.first else {return}
//               //homeLocation = CLLocation(latitude: 49.2675681, longitude: -123.0569122)
//                let distanceInMeters = startLocation?.distance(from: homeLocation)
//                let distanceInKm = distanceInMeters! / 1000
//                print("Distance in meters \(distanceInMeters)")
//                print("Current Location: lat, long:\(startLocation?.coordinate.latitude), \(startLocation?.coordinate.longitude)")
//                
//                print("Distance in km \(distanceInKm)")
//
//            }
//        }
//        
//        func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
//            if status == .authorizedWhenInUse || status == .authorizedAlways {
//                locationManager?.startUpdatingLocation()
//            }
//        }
//        
//    }
//    




