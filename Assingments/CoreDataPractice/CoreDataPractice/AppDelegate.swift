//
//  AppDelegate.swift
//  CoreDataPractice
//
//  Created by Aleksandra Korolczuk on 2017-10-23.
//  Copyright © 2017 Aleksandra Korolczuk. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

 

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    
    
    lazy var persistentContainer: NSPersistentContainer = {
       let container =  NSPersistentContainer(name: "DeathNote")
        
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? { // loads data base
                fatalError("Error while loading persistent store: \(error)")
            }
        })
        
        return container
    }()

}

