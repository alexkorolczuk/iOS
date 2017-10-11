//
//  ParkCell.swift
//  CollectionView
//
//  Created by Aleksandra Korolczuk on 2017-10-02.
//  Copyright © 2017 Aleksandra Korolczuk. All rights reserved.
//

import UIKit





class ParkCell: UICollectionViewCell {
    
    @IBOutlet weak var randomLabel: UILabel!
    
    
    @IBOutlet weak var parkImageView: UIImageView!
    
    
    override func prepareForReuse() {
        parkImageView.image = nil
        randomLabel.text = ""
    }
    
    var park: Park? {
        didSet {
            if let nationalPark = park {
                parkImageView.image = UIImage(named: nationalPark.photo)
                randomLabel.text = nationalPark.photo
            }
        }
    }
    
}
