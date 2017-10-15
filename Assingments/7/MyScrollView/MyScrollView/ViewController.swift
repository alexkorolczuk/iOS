//
//  ViewController.swift
//  MyScrollView
//
//  Created by Aleksandra Korolczuk on 2017-10-15.
//  Copyright © 2017 Aleksandra Korolczuk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
   
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(MyCustomView())
        let contentSize:CGSize
        let gestureRec:UIPanGestureRecognizer = UIPanGestureRecognizer(target: self(), action: #selector(handleGesture)
        
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

