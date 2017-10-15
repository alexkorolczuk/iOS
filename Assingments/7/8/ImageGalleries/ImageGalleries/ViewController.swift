//
//  ViewController.swift
//  ImageGalleries
//
//  Created by Aleksandra Korolczuk on 2017-10-15.
//  Copyright © 2017 Aleksandra Korolczuk. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var myScrollView: UIScrollView!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        myScrollView.delegate = self
        let bug1 = UIImageView(image: #imageLiteral(resourceName: "ladybug"))
        let bug2 = UIImageView(image: #imageLiteral(resourceName: "giantMoth"))
        let bug3 = UIImageView(image: #imageLiteral(resourceName: "beetle"))
        bug1.frame = CGRect(x: 0, y: 0, width: 150, height: 150)
        bug2.frame = CGRect(x: 0, y: 150, width: 150, height: 150)
        bug3.frame = CGRect(x: 0, y: 300, width: 150, height: 150)
        bug1.translatesAutoresizingMaskIntoConstraints = true
        bug2.translatesAutoresizingMaskIntoConstraints = true
        bug3.translatesAutoresizingMaskIntoConstraints = true
        myScrollView.addSubview(bug1)
        myScrollView.addSubview(bug2)
        myScrollView.addSubview(bug3)
        myScrollView.contentSize = CGSize(width:self.view.frame.size.width , height: self.view.frame.size.height)



        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

