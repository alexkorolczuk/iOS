//
//  AddToDoViewController.swift
//  NoSplit
//
//  Created by Aleksandra Korolczuk on 2017-11-27.
//  Copyright © 2017 Derrick Park. All rights reserved.
//

import UIKit

class AddToDoViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var priorityTextField: UITextField!
    @IBOutlet weak var completedSwitch: UISwitch!
    
    @IBOutlet weak var descriptionTextField: UITextField!
    
    weak var delegate: addToDoDelegate!
    
    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
    }
    @IBAction func submitButtonTapped(_ sender: UIButton) {
        let todoTitle = titleTextField.text!
       let todoDescription = descriptionTextField.text!
        let todoPriority = priorityTextField.text!
        let todoCeplited = completedSwitch.isOn
        

        let todo  = ToDo(title: todoTitle, todoDescription: todoDescription, priority: Int(todoPriority)!, isCompleted: todoCeplited)
        delegate.addToDo(todo)
        dismiss(animated: true, completion: nil)
        
    }
    
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder() // enter, keyboard dissappear
        return true
    }

}


protocol addToDoDelegate: class {
    
    func addToDo(_ todo:ToDo)
    
}
