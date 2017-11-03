//
//  ViewController.swift
//  CoreDataPractice
//
//  Created by Aleksandra Korolczuk on 2017-10-23.
//  Copyright © 2017 Aleksandra Korolczuk. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    //var people = [Person]()
    
    var fetchResulController: NSFetchedResultsController<Person>!
    let appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        //self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Death")
    }

  

    @IBAction func filter(_ sender: Any) {
        let alert = UIAlertController(title: "Filter Options", message: nil, preferredStyle: .actionSheet)
        
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Show all", style: .default, handler: { (action) in
            self.reloadData(over: true)
            
            
        }))
        alert.addAction(UIAlertAction(title: "Over 30", style: .default, handler: { (action) in
            self.reloadData(age: 30, over: true)

            
            
        }))
        alert.addAction(UIAlertAction(title: "Under 30", style: .default, handler: { (action) in
            self.reloadData(age: 30, over: false)

    
        }))
        
        present(alert, animated: true, completion: nil)
        
    }
    
    func reloadData(age: Int16 = 0, over: Bool){ // default value. if you dont pass anythig, age = 0
    
        guard let appDelegate = appDelegate else { return}
        let fetchRequest: NSFetchRequest<Person> = Person.fetchRequest() // 1. fetch request
        if age > 0 && over { // create predicates:
            fetchRequest.predicate = NSPredicate(format: "age>=%d", age)
        } else if age > 0 && !over {
            fetchRequest.predicate = NSPredicate(format: "age<=%d", age)
        }
        // sorting descriptor:
        let sortDescriptor = NSSortDescriptor(key: #keyPath(Person.name), ascending: true) // sorting by name
        fetchRequest.sortDescriptors = [sortDescriptor]
        // creating controller:
        
        fetchResulController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: appDelegate.persistentContainer.viewContext, sectionNameKeyPath: nil, cacheName: nil)
        
        
        
        // fetching data:
        do { // perform fetch
            try fetchResulController.performFetch()
                //appDelegate.persistentContainer.viewContext.fetch(fetchRequest)
            //people = fetchedPeople
            self.tableView.reloadData()
        } catch let error {
            print(error)
        }
        
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) { // here we fetch data from database:
        super.viewWillAppear(animated)
       // guard let  appDelegate = appDelegate else {return}
        
        self.reloadData(over: true)
//        let managedContext = appDelegate.persistentContainer.viewContext
//        // define type of fetching data:
////        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Person") // generic type
//
//
//        do {
//             people = try managedContext.fetch(Person.fetchRequest()) // return an array of objects NSManagededObject
//
//        } catch let error as NSError {
//            print(error)
//        }
    }
    
    
    func savePerson(name: String,age:Int16, eyeColor: UIColor) {
        
        guard let  appDelegate = appDelegate else {return}
         let managedContext = appDelegate.persistentContainer.viewContext //z naszego persisnet container ma swoj juz wbudowany context. nic nie tworzysz.
//        let entity = NSEntityDescription.entity(forEntityName: "Person", in: managedContext)!
//
//        //w  kontekscie ktory juz mamy kreujemy entity, ktore jest klasa.taka sama jak z naszego pliku datamodel DeathNote. czyli entity - Person.
//
//
//
//        // tutaj jest staging area, dodajemy obiekty do contekstu.
//
//        let person = NSManagedObject(entity: entity, insertInto: managedContext) // kreujemy obiekt, który wkladamy do kontekstu.
        
        
        // create person object from Person.entity. Person is now a class
        let person = Person(entity: Person.entity(), insertInto: managedContext)
        person.name = name
        person.age = age
        person.eyeColor = eyeColor
        
//        person.setValue(name, forKey: "name") // mamy juz obiekt, i wkladamy do niego nasze property z datamodel pliku.
        
        do {
            try managedContext.save() // like commiting. dodajemy caly context i wszystko co w nim.
            //people.append(person)
        } catch let error as NSError {
            print(error)
        }
    }
    
    
    
    
    @IBAction func addPerson(_ sender: Any) {
        // wyskakuje ci okno z save, cancel etc.
    
        let alertController = UIAlertController(title: "DeathNote", message: "next?", preferredStyle: .alert)
        
        let saveAction = UIAlertAction(title: "Save", style: .default) { (action) in
            
            
            // unwrapping textfield step by step:
            guard let name = alertController.textFields?[0].text,
            let ageString = alertController.textFields?[1].text,
            let eyeColorString = alertController.textFields?[2].text,
            let age = Int16(ageString) else {return}
            
            let eyeColor = self.eyeColorFromString(eyeColorString)
            
            self.savePerson(name: name, age:age, eyeColor: eyeColor)
            self.tableView.reloadData()
            
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .default)
        
        alertController.addTextField()
        alertController.addTextField()
        alertController.addTextField()

        alertController.textFields?[0].placeholder = "name"
        alertController.textFields?[1].placeholder = "age"
        alertController.textFields?[2].placeholder = "eye color"

        alertController.addAction(cancelAction)
        alertController.addAction(saveAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    
    func eyeColorFromString(_ eyeColor: String) -> UIColor {
        switch eyeColor {
        case "Blue":
            return UIColor.blue
        case "Green":
            return UIColor.green
        case "Purple":
            return UIColor.purple
        default:
            return UIColor.brown
        
        }
    }
    
}


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return people.count
        return fetchResulController.fetchedObjects?.count ?? 0
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return fetchResulController.sections?.count ?? 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Death", for: indexPath) as! DeathTableViewCell
       // let person = people[indexPath.row]
        let person = fetchResulController.object(at: indexPath)
       // cell.textLabel?.text = person.name
        //cell.textLabel?.text = person.value(forKey: "name") as! String?
        cell.setupCell(age: person.age, name: person.name, eyeColor: (person.eyeColor as! UIColor)!)
        
        return cell
    }
}

