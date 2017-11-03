//
//  MapViewController.swift
//  CatFlikr
//
//  Created by Aleksandra Korolczuk on 2017-11-02.
//  Copyright © 2017 Aleksandra Korolczuk. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    @IBOutlet var myView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var myMapView: MKMapView!
    var photo: Photo?
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = photo!.title
        imageView.image = photo!.image
        let id = photo!.photoID
        let url = URL(string: "https://api.flickr.com/services/rest/?method=flickr.photos.geo.getLocation&api_key=624af237c2c9c98473ee49a8b6d2347f&photo_id=\(id)&format=json&nojsoncallback=1")!
        print(url)
  
        fetchDatafromFlickr(url: url) {(photo) in
            print("photo")
            self.photo = photo
            self.myView.setNeedsLayout()
            print(self.photo!.lat!)
        }
        
    }


    func fetchDatafromFlickr(url: URL, completion: @escaping (Photo) ->()) {
        let request = URLRequest(url: url)
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            if (error != nil){
                print("Error: \(String(describing: error?.localizedDescription))")
            }
            guard let data = data else { return }
            do {
                let jsonArray = try JSONSerialization.jsonObject(with: data, options: [])
                guard let jsonDictionary = jsonArray as? [AnyHashable:Any],
                    let photo = jsonDictionary["photo"] as? [String:Any],
                    let locationDict = photo["location"] as? [String:Any]
                else { return }
                
                let latitude = locationDict["latitude"] as! String
                let longitude =  locationDict["longitude"] as! String
                self.photo?.lat = Double(latitude)
                self.photo?.long = Double(longitude)
                let my2DLocation : CLLocationCoordinate2D = CLLocationCoordinate2DMake(self.photo!.lat!, (self.photo?.long)!)
                self.photo?.coordinate = my2DLocation
                print("coordinate \(self.photo?.coordinate)")
                self.prepareMyMaptoDisplay()
                DispatchQueue.main.async {
                    print("main queue")
                    completion(self.photo!)
                }
            } catch {
                print("Error serializing data from Json: \(String(describing: error.localizedDescription))")
            }
        }
            dataTask.resume()
        }
    
    
    
    func prepareMyMaptoDisplay() {
        let regionRadius: CLLocationDistance = 1000
        let coordinateRegion = MKCoordinateRegionMakeWithDistance((self.photo?.coordinate)!,
                                                                  regionRadius, regionRadius)
       self.myMapView.setRegion(coordinateRegion, animated: true)
        self.myMapView.addAnnotation(self.photo!)
        
    }

    
}





