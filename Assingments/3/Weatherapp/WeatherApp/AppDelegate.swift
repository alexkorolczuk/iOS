//
//  AppDelegate.swift
//  WeatherApp
//
//  Created by Derrick Park on 2017-05-26.
//  Copyright © 2017 Derrick Park. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let van = City(city_name: "Vancouver", temperature: 15, rainfall: #imageLiteral(resourceName: "default-1"))
    let nyc = City(city_name: "New York City", temperature: 25, rainfall: #imageLiteral(resourceName: "default"))
    let wars = City(city_name: "Warsaw", temperature: 5, rainfall: #imageLiteral(resourceName: "fog"))
    let tokyo = City(city_name: "Tokyo", temperature: 18, rainfall: #imageLiteral(resourceName: "clear-day"))
    let london = City(city_name: "London", temperature: 0, rainfall: #imageLiteral(resourceName: "rain"))
    
    let vanVC = CityViewController()
    let nycVC = CityViewController()
    let warsVC = CityViewController()
    let tokyoVC = CityViewController()
    let londonVC = CityViewController()
    //let addNewCityVC = ViewController()


    let detailVC = DetailedViewController()


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        
        
        let tabBarController = UITabBarController()
        window?.rootViewController = tabBarController
        vanVC.city = van
        nycVC.city = nyc
        warsVC.city = wars
        
        tokyoVC.city = tokyo
        londonVC.city = london
        
        vanVC.tabBarItem = UITabBarItem(title: van.city_name, image: van.rainfall, tag: 0)
        nycVC.tabBarItem = UITabBarItem(title: nyc.city_name, image: nyc.rainfall, tag: 1)
        warsVC.tabBarItem = UITabBarItem(title: wars.city_name, image: wars.rainfall, tag: 2)
        tokyoVC.tabBarItem = UITabBarItem(title: tokyo.city_name, image: tokyo.rainfall, tag: 3)
        londonVC.tabBarItem = UITabBarItem(title: london.city_name, image: london.rainfall, tag: 4)
        

        
        let vanNavigationController = UINavigationController(rootViewController: vanVC)
        let nycNavigationController = UINavigationController(rootViewController: nycVC)
        let warsNavigationController = UINavigationController(rootViewController: warsVC)
        let tokyoNavigationController = UINavigationController(rootViewController: tokyoVC)
        let londonNavigationController = UINavigationController(rootViewController: londonVC)
       // let addNewCityNavigationController = UINavigationController(rootViewController: addNewCityVC)


        
         let navigators = [vanNavigationController, nycNavigationController, warsNavigationController, tokyoNavigationController, londonNavigationController]
        
        tabBarController.viewControllers = navigators

    
        window?.makeKeyAndVisible()
        
        
        return true
    }


}

