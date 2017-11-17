//
//  ImageDetailViewController.swift
//  ImageGalleries
//
//  Created by Aleksandra Korolczuk on 2017-10-15.
//  Copyright © 2017 Aleksandra Korolczuk. All rights reserved.
//

import UIKit

class ImageDetailViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var ImageDetailScrollView: UIScrollView!
    
    @IBOutlet weak var detailedImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ImageDetailScrollView.delegate = self
        

    }

    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return detailedImageView
    }
    
    //viewForZoomingInScrollView

   

}
