//
//  ParkDataSource.swift
//  CollectionView
//
//  Created by Aleksandra Korolczuk on 2017-10-02.
//  Copyright © 2017 Aleksandra Korolczuk. All rights reserved.
//

import Foundation



class ParksDataSource {
    private var parks:[Park] = []
    private var immutableParks:[Park] = []
    private var sections: [String] = []
    var count : Int {
        return parks.count
    }
    
    var numberOfSections: Int {
        return sections.count
    }
    
    init() {
        // create parks
        parks = loadParksFromDisk()
        immutableParks = parks
        
    }

    func numberOfParksInSection(_ section: Int) -> Int {
        let nationalParks = parksForSection(section)
        return nationalParks.count
    }
    
    func parkForItemAtIndexPath(_ indexPath:IndexPath) -> Park {
        if indexPath.section > 0 {
            let nationalPark = parksForSection(indexPath.section)
            return nationalPark[indexPath.item]
        } else  {
            return parks[indexPath.item]
        }
    }
    
    
    func titleForSectionAtIndexPath( _ indexPath: IndexPath) -> String {
        if indexPath.section < section.count {
            return sections[indexPath.section]
        }
        return nil
    }
    
    fileprivate func parksForSection (_ index: Int)  -> [Park] {
    let state = sections[index]
        let parkInSection = parks.filter { (park:Park) -> Bool in
            return park.state == state
        }
        return parkInSection
    }
    
    fileprivate func loadParksFromDisk() -> [Park] {
        
        
        if let path = Bundle.main.path(forResource: "NationalParks", ofType: "plist"){
            if let dictArray = NSArray(contentsOfFile: path) {
                var nationalParks : [Park] = []
                for item in dictArray {
                    if let dict = item as? NSDictionary {
                        let name = dict ["name"] as! String
                        let state = dict ["state"] as! String
                        let date = dict ["date"] as! String
                        let photo  = dict ["photo"] as! String
                        let index = dict ["index"] as! Int
                        
                        
                        let park = Park(name: name, state: state, date: date, photo: photo, index: index)
                        
                        if !sections.contains(state) {
                            // if park nie jest dodany jeszcze nigdzie, to dodamy do go sekcji.
                            sections.append(state)
                        }
                        nationalParks.append(park)

                    }
                }
                return nationalParks // jesli path jest ok, zwracamy ciag parkow
            }
        }
        return [] // jak nie, zwracamy pusty ciag
    }
    
    
    
    
    
}

