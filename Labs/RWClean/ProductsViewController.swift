//
//  ProductsViewController.swift
//  RWClean
//
//  Created by Aleksandra Korolczuk on 2017-11-16.
//  Copyright © 2017 Razeware, LLC. All rights reserved.
//

import UIKit

class ProductsViewController: UIViewController {

    internal var networkClient = NetworkClient.shared
    internal var productType: Product.ProductType! {
        didSet{
            title = productType.title
        }
    }
    
   internal var products: [Product] = []
    
    @IBOutlet internal var collectionView: UICollectionView! {
        didSet {
            let refreshControl = UIRefreshControl()
            refreshControl.addTarget(self,action: #selector(loadProducts),for: .valueChanged)
            collectionView.refreshControl = refreshControl
            let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
            collectionView.collectionViewLayout = CollectionViewCenterFlowLayout(layout: layout)
        }
    }
    
    internal func loadProducts() {
    collectionView.refreshControl?.beginRefreshing()
        networkClient.getProducts ( forType: productType, success: { [weak self] products in
        guard let strongSelf = self else { return }
        strongSelf.products = products
        strongSelf.collectionView.reloadData()
        strongSelf.collectionView.refreshControl?.endRefreshing()
    
     }, failure: { [weak self] error in
        print("Product download failed: \(error)")
        guard let strongSelf = self else { return }
            strongSelf.collectionView.refreshControl?.endRefreshing()
        
        })
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        loadProducts()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        guard let selectedItem = collectionView.indexPathsForSelectedItems else { return }
        selectedItem.forEach {
        collectionView.deselectItem(
        at: $0, animated: false)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let viewController = segue.destination as? ProductDetailsViewController else { return }
            let indexPath = collectionView.indexPathsForSelectedItems!.first!
            let product = products[indexPath.row]
            viewController.product = product
    }
}
    
extension ProductsViewController: UICollectionViewDataSource {
    
    public func collectionView(_ collectionView: UICollectionView,numberOfItemsInSection section: Int) -> Int {
        return products.count
        
    }
    
    public func collectionView(_ collectionView: UICollectionView,    cellForItemAt indexPath: IndexPath)    -> UICollectionViewCell {
        let cellIdentifier = "ProductCell"
        let product = products[indexPath.row]
        let cell = collectionView.dequeueReusableCell( withReuseIdentifier: cellIdentifier,for: indexPath) as! ProductCollectionViewCell
        cell.label.text = product.title
        cell.imageView.rw_setImage(url: product.imageURL)
        return cell
    }
}

