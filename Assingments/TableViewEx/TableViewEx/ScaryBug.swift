//
//  ScaryBug.swift
//  TableViewEx
//
//  Created by Aleksandra Korolczuk on 2017-09-25.
//  Copyright © 2017 Aleksandra Korolczuk. All rights reserved.
//

import UIKit



enum ScaryFactor: String {
    case NotScary = " Not scary"
    case ALittleScary = "A little scary"
    case AverageScary = "Average scariness"
    case QuiteScary = "Quite scary"
    case Aiiiieeee = "AIIIIIEEEEEEE!!"
}


struct ScaryBug {
    var name: String
    var image: UIImage?
    var scary : ScaryFactor

    
    init(withName name: String, imageName: String?, howScary: ScaryFactor) {
        self.name = name
        self.scary = howScary
        if let imageName =  imageName, let iconImage = UIImage(named: imageName){
        self.image = iconImage
        }
    }

    static func scaryFactorToString(scaryFactor:ScaryFactor) -> String {
        var scaryString = ""
        switch(scaryFactor) {
        case .NotScary:
            scaryString = "Not scary"
        case .ALittleScary:
            scaryString = "A little scary"
        case .AverageScary:
            scaryString = "Average scariness"
        case .QuiteScary:
            scaryString = "Quite scary"
        case .Aiiiieeee:
            scaryString = "AIIIIIEEEEEEE!!"
        }
        return scaryString
    }

    static func bugs() -> [ScaryBug] {
        var bugs = [ScaryBug]()

        bugs.append(ScaryBug(withName: "Ladybug", imageName: "ladybug.jpg", howScary: .NotScary))
        bugs.append(ScaryBug(withName: "Potato Bug", imageName: "potatoBug.jpg", howScary: .QuiteScary))
        bugs.append(ScaryBug(withName: "Wolf Spider", imageName: "wolfSpider.jpg", howScary: .Aiiiieeee))
        bugs.append(ScaryBug(withName: "Bee", imageName: "bee.jpg", howScary: .QuiteScary))
        bugs.append(ScaryBug(withName: "Beetle", imageName: "beetle.jpg", howScary: .ALittleScary))
        bugs.append(ScaryBug(withName: "Burrito Insect", imageName: "burritoInsect.jpg", howScary: .AverageScary))
        bugs.append(ScaryBug(withName: "Caterpillar", imageName: "caterpillar.jpg", howScary: .NotScary))
        bugs.append(ScaryBug(withName: "Cicada", imageName: "cicada.jpg", howScary: .AverageScary))
        bugs.append(ScaryBug(withName: "Cockroach", imageName: "cockroach.jpg", howScary: .QuiteScary))
        bugs.append(ScaryBug(withName: "Exoskeleton", imageName: "exoskeleton.jpg", howScary: .QuiteScary))
        bugs.append(ScaryBug(withName: "Fly", imageName: "fly.jpg", howScary: .NotScary))
        bugs.append(ScaryBug(withName: "Giant Moth", imageName: "giantMoth.jpg", howScary: .AverageScary))
        bugs.append(ScaryBug(withName: "Grasshopper", imageName: "grasshopper.jpg", howScary: .Aiiiieeee))
        bugs.append(ScaryBug(withName: "Mosquito", imageName: "mosquito.jpg", howScary: .QuiteScary))
        bugs.append(ScaryBug(withName: "Praying Mantis", imageName: "prayingMantis.jpg", howScary: .NotScary))
        bugs.append(ScaryBug(withName: "Roach", imageName: "roach.jpg", howScary: .QuiteScary))
        bugs.append(ScaryBug(withName: "Robber Fly", imageName: "robberFly.jpg", howScary: .QuiteScary))
        bugs.append(ScaryBug(withName: "Scorpion", imageName: "scorpion.jpg", howScary: .Aiiiieeee))
        bugs.append(ScaryBug(withName: "Shield Bug", imageName: "shieldBug.jpg", howScary: .AverageScary))
        bugs.append(ScaryBug(withName: "Stag Beetle", imageName: "stagBeetle.jpg", howScary: .AverageScary))
        bugs.append(ScaryBug(withName: "Stink Bug", imageName: "stinkbug.jpg", howScary: .ALittleScary))
        return bugs
    }
    
    
}




