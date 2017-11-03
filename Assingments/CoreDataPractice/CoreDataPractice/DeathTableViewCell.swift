//
//  DeathTableViewCell.swift
//  CoreDataPractice
//
//  Created by Aleksandra Korolczuk on 2017-10-24.
//  Copyright © 2017 Aleksandra Korolczuk. All rights reserved.
//

import UIKit

class DeathTableViewCell: UITableViewCell {
    
    @IBOutlet weak var eyeColorView: UIView!
    
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func setupCell(age: Int16, name:String, eyeColor: UIColor){
    ageLabel.text = String(age)
    nameLabel.text = name
    eyeColorView.backgroundColor = eyeColor


}

}
