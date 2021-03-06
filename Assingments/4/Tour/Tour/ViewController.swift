//
//  ViewController.swift
//  Tour
//
//  Created by Aleksandra Korolczuk on 2017-09-21.
//  Copyright © 2017 Aleksandra Korolczuk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let button = UIBarButtonItem(barButtonSystemItem: .redo, target: self, action: #selector(goToFirst))
        navigationItem.rightBarButtonItem = button
    }
    
    @objc func goToFirst(barButton: UIBarButtonItem) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

