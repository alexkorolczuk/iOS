//
//  ViewController.swift
//  GithubRepos
//
//  Created by Aleksandra Korolczuk on 2017-10-19.
//  Copyright © 2017 Aleksandra Korolczuk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var repositories = [RepositoryDataModel]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://api.github.com/users/alexkorolczuk/repos")!
        
        fetchData(url: url) { (repos) in
           // self.tableView.reloadData()
        }
    }
    func fetchData(url: URL, completion: @escaping ([RepositoryDataModel]) ->()) {
        let request = URLRequest(url: url)
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            if (error != nil){
                print("Error: \(String(describing: error?.localizedDescription))")
            }
            
            guard let data = data else { return }
            do {
                let jsonArray = try JSONSerialization.jsonObject(with: data, options: []) as! [[String:Any]]
                for repo in jsonArray{
                    let id = repo["id"] as! Int
                    let name = repo["name"] as! String
                    let language = repo["language"] as? String
                    
                    self.repositories.append(RepositoryDataModel(id:id, name:name, language:language ?? "No language"))
                }
                    DispatchQueue.main.async {
                       completion(self.repositories)
                    }
                
            } catch {
                print("Error serializing data from Json: \(String(describing: error.localizedDescription))")
            }
        }
        dataTask.resume()
        
    }
    
}
//
