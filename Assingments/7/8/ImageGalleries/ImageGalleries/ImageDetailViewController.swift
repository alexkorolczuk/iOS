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
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ImageDetailScrollView.delegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
