//
//  HomeTableViewCell.swift
//  QuotePro
//
//  Created by Derrick Park on 2017-11-23.
//  Copyright © 2017 Derrick Park. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

	@IBOutlet weak var quoteTextLabel: UILabel!
	@IBOutlet weak var authorLabel: UILabel!
	
	func setupCell(quote: Quote) {
		quoteTextLabel.text = quote.quoteText
		authorLabel.text = quote.quoteAuthor
	}
	
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
