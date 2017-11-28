//
//  toDoTableViewCell.swift
//  NoSplit
//
//  Created by Aleksandra Korolczuk on 2017-11-27.
//  Copyright © 2017 Derrick Park. All rights reserved.
//

import UIKit

class toDoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var doneLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
