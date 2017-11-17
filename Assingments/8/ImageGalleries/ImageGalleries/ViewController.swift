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
    let bug1 = UIImageView(image: #imageLiteral(resourceName: "ladybug"))
    let bug2 = UIImageView(image: #imageLiteral(resourceName: "giantMoth"))
    let bug3 = UIImageView(image: #imageLiteral(resourceName: "beetle"))


    override func viewDidLoad() {
        
        super.viewDidLoad()
        myScrollView.delegate = self
       
        bug1.frame = CGRect(x: 0, y: 20, width: 150, height: 150)
        bug2.frame = CGRect(x: 0, y: 180, width: 150, height: 150)
        bug3.frame = CGRect(x: 0, y: 350, width: 150, height: 150)
        
        bug1.translatesAutoresizingMaskIntoConstraints = true
        bug2.translatesAutoresizingMaskIntoConstraints = true
        bug3.translatesAutoresizingMaskIntoConstraints = true
        
        bug1.restorationIdentifier  = "bug1"
        bug2.restorationIdentifier  = "bug2"
        bug3.restorationIdentifier  = "bug3"
        print("aaaaaa")


        let tap1: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(sender:)))
        let tap2: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(sender:)))
        let tap3: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(sender:)))

      
        tap1.numberOfTapsRequired = 1;
        tap2.numberOfTapsRequired = 1;
        tap3.numberOfTapsRequired = 1;

        bug1.addGestureRecognizer(tap1)
        bug2.addGestureRecognizer(tap2)
        bug3.addGestureRecognizer(tap3)
        
        bug1.isUserInteractionEnabled = true;
        bug2.isUserInteractionEnabled = true;
        bug3.isUserInteractionEnabled = true;

        myScrollView.addSubview(bug1)
        myScrollView.addSubview(bug2)
        myScrollView.addSubview(bug3)
        myScrollView.contentSize = CGSize(width:self.view.frame.size.width , height: self.view.frame.size.height)
    }

    @objc func handleTap(sender: UITapGestureRecognizer) {
            print("llala")
//            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
//            let ImageDetailViewController = storyBoard.instantiateViewController(withIdentifier: "ImageDetail") as! ImageDetailViewController
//        ImageDetailViewController.detailedImageView = self.bug1
//        self.present(ImageDetailViewController, animated:true, completion:nil)
           performSegue(withIdentifier: "ImageDetail", sender: self)
        
    }


}

