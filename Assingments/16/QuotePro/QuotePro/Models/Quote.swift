//
//  Quote.swift
//  QuotePro
//
//  Created by Derrick Park on 2017-11-23.
//  Copyright © 2017 Derrick Park. All rights reserved.
//

import Foundation

struct Quote {
	let quoteText: String
	let quoteAuthor: String
	let quoteLink:String
	
	init(quoteText: String, quoteAuthor: String, quoteLink: String) {
		self.quoteText = quoteText
		self.quoteAuthor = quoteAuthor
		self.quoteLink = quoteLink
	}
	
	enum CodingKeys: String, CodingKey {
		case quoteText
		case quoteAuthor
		case quoteLink
	}
}

extension Quote: Decodable {
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		quoteText = try values.decode(String.self, forKey: .quoteText)
		quoteAuthor = try values.decode(String.self, forKey: .quoteAuthor)
		quoteLink = try values.decode(String.self, forKey: .quoteLink)
	}
}
