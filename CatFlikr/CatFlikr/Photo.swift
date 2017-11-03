//
//  Photo.swift
//  CatFlikr
//
//  Created by Aleksandra Korolczuk on 2017-11-02.
//  Copyright © 2017 Aleksandra Korolczuk. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class Photo: NSObject, MKAnnotation {

        let photoID : String
        let farm : Int
        let server : String
        let secret : String
        var title: String?
        var url:URL
        var coordinate: CLLocationCoordinate2D
        var image: UIImage?
        var long: Double?
        var lat: Double?
    
    
    init (photoID:String,farm:Int, server:String, secret:String, title:String, url: URL, coordinate: CLLocationCoordinate2D ) {
            self.photoID = photoID
            self.farm = farm
            self.server = server
            self.secret = secret
            self.title = title
            self.url = url
            self.coordinate = coordinate
        }
    
    }

    

