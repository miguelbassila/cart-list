//
//  ProductsListViewController.swift
//  Cart
//
//  Created by Miguel Bassila on 6/24/15.
//  Copyright (c) 2015 Miguel Bassila. All rights reserved.
//

import UIKit

let reuseIdentifier = "ProductCell"

class ProductsListViewController: UICollectionViewController {
 
  @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
  
  var dataSource: [Product]?

  // MARK: - View Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    getProducts()
  }
  
  // MARK: - Helpers
  func getProducts(productClient: ProductClient = ProductClient()){
    activityIndicator.startAnimating()
    productClient.getAllProducts { [unowned self] (result) in
      self.activityIndicator.stopAnimating()
      switch (result) {
      case let .Error(error):
        self.tryAgainWithMessage(error)
      case let .Value(boxedProducts):
        self.dataSource = boxedProducts.value
        self.collectionView!.reloadData()
      }
    }
  }
  
  func tryAgainWithMessage(message: String) {
    let alertController = UIAlertController(title: "Ops!", message: message, preferredStyle: .Alert)
    
    let tryAgainAction = UIAlertAction(title: "Try Again", style: .Default) { (_) in self.getProducts() }
    alertController.addAction(tryAgainAction)

    let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
    alertController.addAction(cancelAction)

    self.presentViewController(alertController, animated: true, completion: nil)
  }
  
  
  // MARK: - UICollectionViewDataSource
  override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
    return 1
  }
  
  override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return dataSource?.count ?? 0
  }
  
  override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! ProductViewCell

    if let products = dataSource {
      cell.configureCellWithProduct(products[indexPath.row])
    }
    
    return cell
  }
}
