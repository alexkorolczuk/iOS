//
//  NetworkClient.swift
//  QuotePro
//
//  Created by Derrick Park on 2017-11-23.
//  Copyright © 2017 Derrick Park. All rights reserved.
//

import Foundation

struct NetworkClient {
	
	static func getQuote(completion: @escaping (Quote)->()) {
		let url = URL(string: "https://api.forismatic.com/api/1.0/?method=getQuote&format=json&lang=en")!

		let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
			guard let data = data else { return }
			let quote = try? JSONDecoder().decode(Quote.self, from: data)
			if let quote = quote {
				DispatchQueue.main.async {
					completion(quote)
				}
			}
		}
		task.resume()
	}
    
    
    
    
    
}
