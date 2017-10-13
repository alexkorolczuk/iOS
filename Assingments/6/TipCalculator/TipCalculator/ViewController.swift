//
//  ViewController.swift
//  TipCalculator
//
//  Created by Aleksandra Korolczuk on 2017-10-12.
//  Copyright © 2017 Aleksandra Korolczuk. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var sliderLabel: UILabel!
    
  
    
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipPercentageTextField: UITextField!
    var activeTextField: UITextField?
    
    @IBAction func calculateTip(_ sender: UIButton) {
        
        if let userAmount = billAmountTextField?.text, let userTip = tipPercentageTextField?.text{
            if Int(userAmount) != nil || Int(userTip) != nil
            {
                let tipAmount = Double(userAmount)! * Double(tipSlider.value)
                tipAmountLabel.text = String(tipAmount)
            } else {
                print("Wrong input")
            }
        }
    }
    
    @IBAction func adjustTipPercentage(_ sender: UISlider) {
        tipSlider.maximumValue = 100
        tipSlider.minimumValue = 0
        sliderLabel.text = String(tipSlider.value)
        tipSlider.addTarget(self, action:#selector(onSliderValChanged(slider:event:)), for: .valueChanged)
    }
    
    
    //UIControl is for UIKit elements
    //notification - send messages// between classes, view controllers
    
    
    @objc func onSliderValChanged(slider: UISlider, event: UIEvent) {
        if let touchEvent = event.allTouches?.first {
            switch touchEvent.phase {
            case .ended:
                if let userAmount = billAmountTextField?.text{
                    if Int(userAmount) != nil
                    {
                        let tipAmount = Double(userAmount)! * Double(tipSlider.value)
                        tipAmountLabel.text = String(tipAmount)
                    } else {
                        print("Wrong input")
                    }
                }
            default:
                break
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        billAmountTextField.delegate = self
        tipPercentageTextField.delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillShow(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillHide(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
//        billAmountTextField.placeholder = "Put amount"
//        tipPercentageTextField.placeholder = "Put %"
//        billAmountTextField.textColor = UIColor.lightGray
//        tipPercentageTextField.textColor = UIColor.lightGray

    }

    @objc func keyboardWillShow(notification: NSNotification) {
        
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if keyboardSize.height >= (activeTextField?.frame.origin.y)! {
                return
            }
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
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        activeTextField?.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField){
        activeTextField = textField
    }
    
    func textFieldDidEndEditing(_ textField: UITextField){
        activeTextField = nil
    }


}
