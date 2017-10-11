//
//  MasterViewController.swift
//  CollectionView
//
//  Created by Aleksandra Korolczuk on 2017-10-02.
//  Copyright © 2017 Aleksandra Korolczuk. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class MasterViewController: UICollectionViewController {

    
    fileprivate var parksDataSource  = ParksDataSource()
    override func viewDidLoad() {
        super.viewDidLoad()
        let width = collectionView!.frame.size.width / 3 // size for each cell
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: width, height: width)
            
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

   
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return parksDataSource.numberOfSections
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return parksDataSource.numberOfParksInSection(section)
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ParkCell
    
        
        if let park = parksDataSource.parkForItemAtIndexPath(indexPath){
            cell.park = park
        }
        
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let sectionHeaderView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SectionHeader", for: indexPath) as! SectionHeaderView
        
        
        if let title = parksDataSource.titleForSectionAtIndexPath
    }

}
