//
//  ViewController.swift
//  TableViewEx
//
//  Created by Aleksandra Korolczuk on 2017-09-25.
//  Copyright © 2017 Aleksandra Korolczuk. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var bugs: [ScaryBug] = ScaryBug.bugs()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bugs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellReuseIdentifier")! 
        
        
        let text = bugs[indexPath.row].name
  
        cell.textLabel?.text = text
        cell.imageView?.image = bugs[indexPath.row].image
        cell.detailTextLabel?.text = bugs[indexPath.row].scary.rawValue

        return cell
    }



    
}

