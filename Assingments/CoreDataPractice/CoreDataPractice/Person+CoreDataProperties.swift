//
//  Person+CoreDataProperties.swift
//  CoreDataPractice
//
//  Created by Aleksandra Korolczuk on 2017-10-24.
//  Copyright © 2017 Aleksandra Korolczuk. All rights reserved.
//
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }

    @NSManaged public var name: String
    @NSManaged public var age: Int16
    @NSManaged public var eyeColor: NSObject?

    

}
