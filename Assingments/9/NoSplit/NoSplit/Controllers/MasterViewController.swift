//
//  MasterViewController.swift
//  NoSplit
//
//  Created by Derrick Park on 2017-06-13.
//  Copyright © 2017 Derrick Park. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    var todos = [ToDo]()


    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = self.editButtonItem


    }

    override func viewWillAppear(_ animated: Bool) {
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }



    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let todo = todos[indexPath.row]
                let controller = segue.destination as! DetailViewController
                controller.detailItem = todo
            }
        } else if segue.identifier == "addTodo" {
            let controller = segue.destination as! AddToDoViewController
            controller.delegate = self
        }
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath as IndexPath) as! toDoTableViewCell
        
        let todo = todos[indexPath.row]
        cell.titleLabel.text = todo.title
        cell.descriptionLabel.text! = todo.todoDescription
        cell.doneLabel.text = todo.isCompleted ? "👍" : "👎"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            todos.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath as IndexPath], with: .fade)
        } else if editingStyle == .insert {
        }
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        
    }

}






extension MasterViewController: addToDoDelegate {
    
    
    
    
    func addToDo(_ todo: ToDo) {
        todos.append(todo)
        tableView.reloadData()
    }
    
}

