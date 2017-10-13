//
//  ViewController.swift
//  TipCalculator
//
//  Created by Aleksandra Korolczuk on 2017-10-12.
//  Copyright © 2017 Aleksandra Korolczuk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipPercentageTextField: UITextField!
    
    
    
    @IBAction func calculateTip(_ sender: UIButton) {
        
        if let userAmount = billAmountTextField?.text, let userTip = tipPercentageTextField?.text {
            if Int(userAmount) != nil || Int(userTip) != nil {
                let tipAmount = Double(userAmount)! * Double(userTip)!
                tipAmountLabel.text = String(tipAmount)
            } else {
                print("Wrong input")
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        billAmountTextField.placeholder = "Put amount"
        tipPercentageTextField.placeholder = "Put %"
        billAmountTextField.textColor = UIColor.lightGray
        tipPercentageTextField.textColor = UIColor.lightGray
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillShow(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillHide(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)

    }

    @objc func keyboardWillShow(notification: NSNotification) {
        self.view.frame.origin.y -= 150
    }
    @objc func keyboardWillHide(notification: NSNotification) {
        self.view.frame.origin.y += 150
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



}
