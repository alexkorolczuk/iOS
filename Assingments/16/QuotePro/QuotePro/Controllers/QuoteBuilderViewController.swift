//
//  QuoteBuilderViewController.swift
//  QuotePro
//
//  Created by Derrick Park on 2017-11-23.
//  Copyright © 2017 Derrick Park. All rights reserved.
//

import UIKit

class QuoteBuilderViewController: UIViewController {
	
	@IBOutlet weak var mainView: UIView!
	weak var quoteView: QuoteView!
	weak var delegate: HomeTableViewControllerDelegate!
	
	override func viewDidLoad() {
        super.viewDidLoad()
		
		quoteView = QuoteView.instanceFromNib()
		mainView.translatesAutoresizingMaskIntoConstraints = false
		mainView.addSubview(quoteView)
		quoteView.settingUpConstraints(view: mainView)
    }

	@IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
		delegate.saveQuote(quote: quoteView.getCurrentQuote)
		self.navigationController?.popViewController(animated: true)
	}
	
	@IBAction func quoteButtonTapped(_ sender: UIBarButtonItem) {
		NetworkClient.getQuote {  [weak self] quote in
			guard let this = self else { return }
			this.quoteView.setupWithQuote(quote: quote)
		}
	}
	
	@IBAction func imageButtonTapped(_ sender: UIBarButtonItem) {
		// change image
	}
}

protocol HomeTableViewControllerDelegate:class {
	func saveQuote(quote: Quote)
}
