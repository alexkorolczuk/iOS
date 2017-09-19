//
//  ViewController.swift
//  ProgrammaticView
//
//  Created by Derrick Park on 2017-05-24.
//  Copyright © 2017 Derrick Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let framingView: UIView = UIView(frame: CGRect.zero)
    let squareButton: UIButton = UIButton(type: .system)
    let portraitButton: UIButton = UIButton(type: .system)
    let landscapeButton: UIButton = UIButton(type: .system)
    var framingViewHeightConstraint: NSLayoutConstraint = NSLayoutConstraint.init()
    var framingViewWidthConstraint: NSLayoutConstraint = NSLayoutConstraint.init()
    
    //my shapes:
    let purpleBox: UIView = UIView(frame: CGRect.zero)
    let blueBox1: UIView = UIView(frame: CGRect.zero)
    let blueBox2: UIView = UIView(frame: CGRect.zero)
    let blueBox3: UIView = UIView(frame: CGRect.zero)
    let orangeBox1: UIView = UIView(frame: CGRect.zero)
    let orangeBox2: UIView = UIView(frame: CGRect.zero)
    let redBox: UIView = UIView(frame: CGRect.zero)
    
 
   

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        squareButton.setTitle("Square", for: .normal)
        squareButton.addTarget(self, action: #selector(resizeFramingView), for: .touchUpInside)
        view.addSubview(squareButton)
        squareButton.translatesAutoresizingMaskIntoConstraints = false
        
        portraitButton.setTitle("Portrait", for: .normal)
        portraitButton.addTarget(self, action: #selector(resizeFramingView), for: .touchUpInside)
        view.addSubview(portraitButton)
        portraitButton.translatesAutoresizingMaskIntoConstraints = false
        
        landscapeButton.setTitle("Landscape", for: .normal)
        landscapeButton.addTarget(self, action: #selector(resizeFramingView), for: .touchUpInside)
        view.addSubview(landscapeButton)
        landscapeButton.translatesAutoresizingMaskIntoConstraints = false
        
        framingView.translatesAutoresizingMaskIntoConstraints = false
        framingView.backgroundColor = UIColor.green
        view.addSubview(framingView)
        
        //my shapes:

        
        purpleBox.translatesAutoresizingMaskIntoConstraints = false
        purpleBox.backgroundColor = UIColor.purple
        framingView.addSubview(purpleBox)
        
        blueBox1.translatesAutoresizingMaskIntoConstraints = false
        blueBox1.backgroundColor = UIColor.blue
        framingView.addSubview(blueBox1)
        
        blueBox2.translatesAutoresizingMaskIntoConstraints = false
        blueBox2.backgroundColor = UIColor.blue
        framingView.addSubview(blueBox2)
        
        
        blueBox3.translatesAutoresizingMaskIntoConstraints = false
        blueBox3.backgroundColor = UIColor.blue
        framingView.addSubview(blueBox3)
        
        redBox.translatesAutoresizingMaskIntoConstraints = false
        redBox.backgroundColor = UIColor.red
        framingView.addSubview(redBox)
        

        orangeBox1.translatesAutoresizingMaskIntoConstraints = false
        orangeBox1.backgroundColor = UIColor.orange
        redBox.addSubview(orangeBox1)
        
        orangeBox2.translatesAutoresizingMaskIntoConstraints = false
        orangeBox2.backgroundColor = UIColor.orange
        redBox.addSubview(orangeBox2)
        
        
       
        
        let buttonsHorizontalContraintsFormat = "|[squareButton(==portraitButton)][portraitButton(==landscapeButton)][landscapeButton]|"
        // equal spacing for elements.
        
        
     
        let buttonsHorizontalContraints = NSLayoutConstraint.constraints(withVisualFormat: buttonsHorizontalContraintsFormat, options: .alignAllCenterY, metrics: nil, views: ["squareButton":squareButton, "portraitButton":portraitButton, "landscapeButton":landscapeButton]) //  constrains z kilkoma elementami  w foramacie.
        
        NSLayoutConstraint.activate(buttonsHorizontalContraints)
        
        
        // PURPLE BOX
        
        let purpleBoxRightConstraint = NSLayoutConstraint.init(item: purpleBox, attribute: .right, relatedBy: .equal, toItem: framingView, attribute: .right, multiplier: 1.0, constant: -20.0)
        purpleBoxRightConstraint.isActive = true
        
        let purpleBoxBottomConstraint = NSLayoutConstraint.init(item: purpleBox, attribute: .bottom, relatedBy: .equal, toItem: framingView, attribute: .bottom, multiplier: 1.0, constant: -20.0)
        purpleBoxBottomConstraint.isActive = true
        
        let purpleBoxWidthConstraint = NSLayoutConstraint.init(item: purpleBox, attribute: .width, relatedBy: .equal, toItem: framingView, attribute: .width, multiplier: 305.0/500.0, constant: 20.0)
        purpleBoxWidthConstraint.isActive = true
        
        let purpleBoxHeightConstraint = NSLayoutConstraint.init(item: purpleBox, attribute: .height, relatedBy: .equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1.0, constant: 50.0)
        purpleBoxHeightConstraint.isActive = true
        
        // RED BOX

        
        let RedWidthConstraint = NSLayoutConstraint.init(item: redBox, attribute: .width, relatedBy: .equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1.0, constant: 135.0)
        RedWidthConstraint.isActive = true
        
        let RedHeightConstraint = NSLayoutConstraint.init(item: redBox, attribute: .height, relatedBy: .equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1.0, constant: 40.0)
        RedHeightConstraint.isActive = true
        
        
        let RedBoxTopConstraint = NSLayoutConstraint.init(item: redBox, attribute: .top, relatedBy: .equal, toItem: framingView, attribute: .top, multiplier: 1.0, constant: 20.0)
        RedBoxTopConstraint.isActive = true
        
        let RedBoxRightConstraint = NSLayoutConstraint.init(item: redBox, attribute: .right, relatedBy: .equal, toItem: framingView, attribute: .right, multiplier: 1.0, constant: -20.0)
        RedBoxRightConstraint.isActive = true
        
        
        //---------------ORANGE BOXES:
        
        let Orange1WidthConstraint = NSLayoutConstraint.init(item: orangeBox1, attribute: .width, relatedBy: .equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1.0, constant: 70.0)
        Orange1WidthConstraint.isActive = true
        
        let Orange1HeightConstraint = NSLayoutConstraint.init(item: orangeBox1, attribute: .height, relatedBy: .equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1.0, constant: 30.0)
        Orange1HeightConstraint.isActive = true
        
        
        let Orange1LeftConstraint = NSLayoutConstraint.init(item: orangeBox1, attribute: .left, relatedBy: .equal, toItem: redBox, attribute: .left, multiplier: 1.0, constant: 5.0)
        Orange1LeftConstraint.isActive = true
        
        let Orange1TopConstraint = NSLayoutConstraint.init(item: orangeBox1, attribute: .top, relatedBy: .equal, toItem: redBox, attribute: .top, multiplier: 1.0, constant: 5.0)
        Orange1TopConstraint.isActive = true
        
        
        
        let Orange2WidthConstraint = NSLayoutConstraint.init(item: orangeBox2, attribute: .width, relatedBy: .equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1.0, constant: 50.0)
        Orange2WidthConstraint.isActive = true
        
        let Orange2HeightConstraint = NSLayoutConstraint.init(item: orangeBox2, attribute: .height, relatedBy: .equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1.0, constant: 30.0)
        Orange2HeightConstraint.isActive = true
        
        let Orange2RightConstraint = NSLayoutConstraint.init(item: orangeBox2, attribute: .right, relatedBy: .equal, toItem: redBox, attribute: .right, multiplier: 1.0, constant: -5.0)
        Orange2RightConstraint.isActive = true
        
        let Orange2TopConstraint = NSLayoutConstraint.init(item: orangeBox2, attribute: .top, relatedBy: .equal, toItem: redBox, attribute: .top, multiplier: 1.0, constant: 5.0)
        Orange2TopConstraint.isActive = true
        
        
        //--------------BLUE BOXES ------------
        
        
        let blueBoxWidthConstraint = NSLayoutConstraint.init(item: blueBox1, attribute: .width, relatedBy: .equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1.0, constant: 50.0)
        blueBoxWidthConstraint.isActive = true
        
        let blueBoxHeightConstraint = NSLayoutConstraint.init(item: blueBox1, attribute: .height, relatedBy: .equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1.0, constant: 50.0)
        blueBoxHeightConstraint.isActive = true
        
        let blueBoxTopConstraint = NSLayoutConstraint.init(item: blueBox1, attribute: .top, relatedBy: .equal, toItem: framingView, attribute: .top, multiplier: 1.0, constant: 20.0)
        blueBoxTopConstraint.isActive = true
        
        let blueCenterXConstraint = NSLayoutConstraint.init(item: blueBox1, attribute: .centerX, relatedBy: .equal, toItem: framingView, attribute: .centerX, multiplier: 1.0, constant: 0.0)
        blueCenterXConstraint.isActive = true
        
        let blueBox2WidthConstraint = NSLayoutConstraint.init(item: blueBox2, attribute: .width, relatedBy: .equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1.0, constant: 50.0)
        blueBox2WidthConstraint.isActive = true
        
        let blueBox2HeightConstraint = NSLayoutConstraint.init(item: blueBox2, attribute: .height, relatedBy: .equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1.0, constant: 50.0)
        blueBox2HeightConstraint.isActive = true
        
        
        let blue2CenterXConstraint = NSLayoutConstraint.init(item: blueBox2, attribute: .centerX, relatedBy: .equal, toItem: framingView, attribute: .centerX, multiplier: 1.0, constant: 0.0)
        blue2CenterXConstraint.isActive = true
//
        let blueBox2BottomConstraint = NSLayoutConstraint.init(item: blueBox2, attribute: .top, relatedBy: .equal, toItem: blueBox1, attribute: .bottom, multiplier: 1.0, constant: 50.0)
        blueBox2BottomConstraint.isActive = true
        
        
       
        
        let blueBox3WidthConstraint = NSLayoutConstraint.init(item: blueBox3, attribute: .width, relatedBy: .equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1.0, constant: 50.0)
        blueBox3WidthConstraint.isActive = true
        
        let blueBox3HeightConstraint = NSLayoutConstraint.init(item: blueBox3, attribute: .height, relatedBy: .equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1.0, constant: 50.0)
        blueBox3HeightConstraint.isActive = true

        
        let blue3CenterXConstraint = NSLayoutConstraint.init(item: blueBox3, attribute: .centerX, relatedBy: .equal, toItem: framingView, attribute: .centerX, multiplier: 1.0, constant: 0.0)
        blue3CenterXConstraint.isActive = true

        let blueBox3BottomConstraint = NSLayoutConstraint.init(item: blueBox3, attribute: .top, relatedBy: .equal, toItem: blueBox2, attribute: .bottom, multiplier: 1.0, constant: 50.0)
        blueBox3BottomConstraint.isActive = true
        
        //-------------------------
        
        let squareButtonBottomConstraint = NSLayoutConstraint.init(item: squareButton, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1.0, constant: -50.0)
        squareButtonBottomConstraint.isActive = true
        
        let framingViewCenterXContraint = NSLayoutConstraint.init(item: framingView, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1.0, constant: 0.0)
        
        framingViewCenterXContraint.isActive = true
        
        let framingViewCenterYContraint = NSLayoutConstraint.init(item: framingView, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1.0, constant: 0.0)
        
        framingViewCenterYContraint.isActive = true
        
        framingViewHeightConstraint = NSLayoutConstraint.init(item: framingView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 500.0)
        framingViewHeightConstraint.isActive = true
        
        framingViewWidthConstraint = NSLayoutConstraint.init(item: framingView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 500.0)
        framingViewWidthConstraint.isActive = true
    
    }

    
    // change the green box function:
    func resizeFramingView(_ sender: UIButton) {
        var newWidth: CGFloat = 0.0
        var newHeight: CGFloat = 0.0
        if (sender == self.squareButton) {
            newWidth = 500.0
            newHeight = 500.0
        } else if (sender == self.portraitButton) {
            newWidth = 350.0
            newHeight = 550.0
        } else if (sender == self.landscapeButton) {
            newWidth = 900.0
            newHeight = 300.0
        }
        
        
        //animation for the green box:
        UIView.animate(withDuration: 2.0) {
            self.framingViewHeightConstraint.constant = newHeight
            self.framingViewWidthConstraint.constant = newWidth
            self.view.layoutIfNeeded()
        }
    }
}

