//
//  FlickrPhotosViewController.swift
//  CatFlikr
//
//  Created by Aleksandra Korolczuk on 2017-11-01.
//  Copyright © 2017 Aleksandra Korolczuk. All rights reserved.
//

import UIKit
import MapKit



class FlickrPhotosViewController: UICollectionViewController {
    
    @IBOutlet weak var searchTextField: UITextField!
    var photos = [Photo]()
    var chosenPhotoTitle:String = ""
    var passedTag: String?
    fileprivate let itemsPerRow: CGFloat = 2
    @IBOutlet var mainCollectionView: UICollectionView!
    

    
    fileprivate let reuseIdentifier = "FlickrCell"
    fileprivate let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
    
    override func viewDidLoad() {
        var tag = ""
        
        if let text = self.passedTag, !(passedTag?.isEmpty)! {
            tag = text
        } else {
            tag = "cat"
        }
    
        let url = URL(string: "https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=dfc2b7b291366172ba24cc9e17a2e7ae&tags=\(tag)&has_geo=1&extras=url_m&format=json&nojsoncallback=1")!
        
        fetchDatafromFlickr(url:url) {(photos) in
            self.photos = photos
            self.mainCollectionView.reloadData()
            
        }
    }
    
    func fetchDatafromFlickr(url: URL, completion: @escaping ([Photo]) ->()) {
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
                    let photos = jsonDictionary["photos"] as? [String:Any],
                    let photoArray = photos["photo"] as? [[String:Any]] else {
                        return
                }
                for photo in photoArray {
                    guard let photoID = photo["id"] as? String,
                        let farm = photo["farm"] as? Int ,
                        let server = photo["server"] as? String ,
                        let secret = photo["secret"] as? String,
                        let title = photo["title"] as? String
                        else {
                            break
                    }
                     let urlOfPhoto = URL(string: "https://farm\(farm).staticflickr.com/\(server)/\(photoID)_\(secret).jpg")
                    var C2D : CLLocationCoordinate2D = CLLocationCoordinate2DMake(0.0, 0.0)
                    let photoObject = Photo(photoID: photoID, farm: farm, server: server, secret: secret, title:title, url: urlOfPhoto!, coordinate: C2D)
                    self.photos.append(photoObject)
                    
                }
                DispatchQueue.main.async {
                    completion(self.photos)
                }
                
            } catch {
                print("Error serializing data from Json: \(String(describing: error.localizedDescription))")
            }
        }
        dataTask.resume()
        
    }
}
extension FlickrPhotosViewController {
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
        
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier,
                                                      for: indexPath) as! FlickrPhotoCell
        
        cell.backgroundColor = UIColor.white
        print("should show sth?!")
        cell.titleLabel.text = photos[indexPath.row].title
        let url = photos[indexPath.row].url
        let data = try? Data(contentsOf: url)
        cell.imageView.image = UIImage(data: data!)
        photos[indexPath.row].image = cell.imageView.image
        print(photos[indexPath.row].title)
        cell.tag = indexPath.row

        return cell
    }
    
  
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let secondViewController = self.storyboard!.instantiateViewController(withIdentifier: "MapViewController") as! MapViewController;

        secondViewController.photo = photos[indexPath.row]
        self.navigationController!.pushViewController(secondViewController, animated: true)
    }
}
    
extension FlickrPhotosViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
    
    
    
}

