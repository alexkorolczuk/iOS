//
//  ViewController.swift
//  NotificationCenterPractice
//
//  Created by Aleksandra Korolczuk on 2017-10-13.
//  Copyright © 2017 Aleksandra Korolczuk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var secondTextField: UITextField!
    @IBOutlet weak var firstTextField: UITextField!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillShow(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillHide(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            UIView.animate(withDuration: 0.5, animations: {
                 self.view.frame.origin.y -= keyboardSize.height
                print("show")
                print(keyboardSize.size.height)
            })

    }
    }
        
        @objc func keyboardWillHide(notification: NSNotification) {
            
            if let keyboardSize = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
                UIView.animate(withDuration: 0.5, animations: {
                    self.view.frame.origin.y = 0
                    print("hide")
                })
            }
        }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

