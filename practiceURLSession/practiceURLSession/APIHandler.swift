//
//  APIHandler.swift
//  practiceURLSession
//
//  Created by Aleksandra Korolczuk on 2017-10-06.
//  Copyright © 2017 Aleksandra Korolczuk. All rights reserved.
//

import Foundation


class APIHandler: URLSessionDataTask {
let long: Double = 49.00
let lat:Double = 53.00


var address: String {
    var address = "http://" + "api.openweathermap.org/data/2.5/weather?lat="
    address = address + String(describing: lat)
    address = address + "&lon="
    address = address + String(describing: long)
    address = address + "&APPID=2b4f4a5f48466e99d8a1f24f3a906eaf"
    print(address)
    
    //   + "api.openweathermap.org/data/2.5/forecast?lat={" + self._lat + "}&lon={" + self._long + "}"
    return address
}
    
var url:URL {
    return URL(string: address)!
}
    
    
    func APICallForCurrentWeather() {
    let sessionConfig = URLSessionConfiguration.default
    let session = URLSession(configuration: sessionConfig)
    let request = URLRequest(url:url)
        
        let dataTask = session.dataTask(with: request, completionHandler: {
            (data, response, error) in
            guard error == nil else {
                print("error calling API request")
                return
            }
            guard let responseData = data else {
                print("error: no data")
            }
            do {
                
          
        })
        dataTask.resume()
    
    }
}
