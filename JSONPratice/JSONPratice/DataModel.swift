//
//  DataModel.swift
//  JSONPratice
//
//  Created by Aleksandra Korolczuk on 2017-09-28.
//  Copyright © 2017 Aleksandra Korolczuk & Momoko Nakada. All rights reserved.
//

import Foundation
import Alamofire



class DataModel {
    // empty data model object:
    private var _date: Double?
    private var _temp: String?
    private var _location: String?
    private var _weather: String?
    // json obj as key value:
    typealias JSONStandard  = Dictionary<String, AnyObject>
    
    // url with my location and my key
    let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=Vancouver&appid=2b4f4a5f48466e99d8a1f24f3a906eaf")!

    // error handling in case nil:
    var date: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        let date = Date(timeIntervalSince1970: _date!)
        return (_date != nil) ? "Today, \(dateFormatter.string(from: date))" : "Date Invalid"
    }
    
    var temp: String {
        return _temp ?? "0 °C"
    }
    
    var location: String {
        return _location ?? "Location Invalid"
    }
    
    var weather: String {
        return _weather ?? "Weather Invalid"
    }
    
    //using pod to get jason data and put them into DataModel obj
    func downloadData(completed: @escaping ()-> ()) {
        
        Alamofire.request(url).responseJSON(completionHandler: {
            response in
            let result = response.result
            
            if let dict = result.value as? JSONStandard,
                let main = dict["main"] as? JSONStandard,
                let temp = main["temp"] as? Double,
                let weatherArray = dict["weather"] as? [JSONStandard],
                let weather = weatherArray[0]["main"] as? String,
                let name = dict["name"] as? String,
                let sys = dict["sys"] as? JSONStandard,
                let country = sys["country"] as? String,
                let dt = dict["dt"] as? Double {
                
                self._temp = String(format: "%.0f °C", temp - 273.15)
                self._weather = weather
                self._location = "\(name), \(country)"
                self._date = dt
            }
            
            completed()
        })
    }
    
    
}
