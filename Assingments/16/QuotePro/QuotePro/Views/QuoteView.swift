//
//  QuoteView.swift
//  QuotePro
//
//  Created by Derrick Park on 2017-11-23.
//  Copyright © 2017 Derrick Park. All rights reserved.
//

import UIKit

class QuoteView: UIView {
	
	@IBOutlet weak var quoteTextLabel: UILabel!
	@IBOutlet weak var quoteImageView: UIImageView!
	@IBOutlet weak var quoteAuthorLabel: UILabel!
	
	lazy var getCurrentQuote: Quote = {
		return Quote(quoteText: self.quoteTextLabel.text!, quoteAuthor: self.quoteAuthorLabel.text!, quoteLink: "")
	}()
	
	internal func setupWithQuote(quote: Quote) {
		quoteTextLabel.text = quote.quoteText
		quoteAuthorLabel.text = quote.quoteAuthor
	}
	
	internal func settingUpConstraints(view: UIView) {
		self.translatesAutoresizingMaskIntoConstraints = false
		
		let margins = view.layoutMarginsGuide
		self.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
		self.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
		self.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
		self.bottomAnchor.constraint(equalTo: margins.bottomAnchor).isActive = true
	}
	
	class func instanceFromNib() -> QuoteView {
		return UINib(nibName: "QuoteView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! QuoteView
	}
}


