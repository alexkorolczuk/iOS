//
//  SearchViewController.swift
//  CatFlikr
//
//  Created by Aleksandra Korolczuk on 2017-11-03.
//  Copyright © 2017 Aleksandra Korolczuk. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITextFieldDelegate {
 
    
    @IBOutlet weak var myLabel: UILabel!
    
    @IBOutlet weak var myTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        myTextField.delegate = self
        
    }

   
    @IBAction func buttonClicked(_ sender: Any) {
        myTextField.resignFirstResponder()
        myLabel.text = myTextField.text
        let mainViewController = self.storyboard!.instantiateViewController(withIdentifier: "FlickrPhotosViewController") as! FlickrPhotosViewController;
        mainViewController.passedTag = myTextField.text
        self.navigationController!.pushViewController(mainViewController, animated: true)
    }
    
}
