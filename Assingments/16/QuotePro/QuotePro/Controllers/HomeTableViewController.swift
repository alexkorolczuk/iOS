//
//  HomeTableViewController.swift
//  QuotePro
//
//  Created by Derrick Park on 2017-11-23.
//  Copyright © 2017 Derrick Park. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController {
	var quotes: [Quote] = []
	private let segueID = "AddQuote"
	private let cellID = "Home"
    override func viewDidLoad() {
        super.viewDidLoad()
		
    }
	
	func snapshot(view: UIView) -> UIImage? {
		UIGraphicsBeginImageContextWithOptions(view.bounds.size, true, 0)
		view.drawHierarchy(in: view.bounds, afterScreenUpdates: true)
		let image = UIGraphicsGetImageFromCurrentImageContext()
		UIGraphicsEndImageContext()
		return image
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == segueID {
			let destVC = segue.destination as! QuoteBuilderViewController
			destVC.delegate = self
		}
	}
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return quotes.count
    }
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: cellID) as! HomeTableViewCell
		let quote = quotes[indexPath.row]
		cell.setupCell(quote: quote)
		return cell
	}
	
	// MARK - Table view delegate
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		// image to share
		let image = UIImage(named: "placeholder")!
		// set up activity view controller
		
		let imageToShare = [ image ]
		let activityViewController = UIActivityViewController(activityItems: imageToShare, applicationActivities: nil)
		activityViewController.popoverPresentationController?.sourceView = self.view
		
		// present the view controller
		self.present(activityViewController, animated: true, completion: nil)
	}
}

extension HomeTableViewController: HomeTableViewControllerDelegate {
	func saveQuote(quote: Quote) {
		quotes.append(quote)
		tableView.reloadData()
	}
}


