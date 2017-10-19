//
//  ViewController.swift
//  PracticeURLSession
//
//  Created by Aleksandra Korolczuk on 2017-10-19.
//  Copyright © 2017 Aleksandra Korolczuk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var iPhoneImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "http://imgur.com/bktnImE.png")!
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let downloadTask = session.downloadTask(with: url) {(location, response, error) in
            
            if (error != nil) {
                print("Error: \(String(describing: error?.localizedDescription))")
                return
            }
            
            guard let loc = location else {return}
            guard let data = try? Data(contentsOf: loc) else {return}
            let image = UIImage(data:data)
            
            DispatchQueue.main.async {
                self.iPhoneImageView.image = image
            }
        }
    downloadTask.resume()
    }

}

