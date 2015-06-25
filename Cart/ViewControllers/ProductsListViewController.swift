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
  var product: Product?
  
  // MARK: - View Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    self.title = NSLocalizedString("title_productList", comment: "View controller title")
    getProducts()
  }
  
  // MARK: - Helpers
  func getProducts(productClient: ProductClient = ProductClient()){
    activityIndicator.startAnimating()
    productClient.getAllProducts { [unowned self] (result) in
      self.activityIndicator.stopAnimating()
      switch result {
      case let .Error(error):
        self.tryAgainWithMessage(true, message: error)
      case let .Value(boxedProducts):
        self.dataSource = boxedProducts.value
        self.collectionView!.reloadData()
      }
    }
  }
  
  func getProductDetail(product: Product, productClient: ProductClient = ProductClient()){
    activityIndicator.startAnimating()
    productClient.getDetailFromProduct(product) { [unowned self] (result) in
      self.activityIndicator.stopAnimating()
      switch result {
      case let .Error(error):
        self.tryAgainWithMessage(false, message: error)
      case let .Value(boxedProduct):
        self.product = boxedProduct.value
        self.performSegueWithIdentifier("showProductDetail", sender: self)
      }
    }
  }
  
  func tryAgainWithMessage(try: Bool, message: String) {
    let alertController = UIAlertController(title: "Ops!", message: message, preferredStyle: .Alert)

    if try {
      getProductsAlertController(alertController)
    } else {
      getProductDetailAlertController(alertController)
    }
    
    self.presentViewController(alertController, animated: true, completion: nil)
  }
  
  func getProductsAlertController(alertController: UIAlertController) {
    let tryAgainAction = UIAlertAction(title: "Try Again", style: .Default) { (_) in self.getProducts() }
    alertController.addAction(tryAgainAction)
    
    let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
    alertController.addAction(cancelAction)
  }
  
  func getProductDetailAlertController(alertController: UIAlertController) {
    let cancelAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
    alertController.addAction(cancelAction)
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
  
  // MARK: - UICollectionViewDelegate
  override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
    if let products = dataSource {
      getProductDetail(products[indexPath.row])
    }
  }
  
  // MARK: - Navigation
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if let identifier = segue.identifier {
      if identifier == "showProductDetail" {
        if let seguedViewController = segue.destinationViewController as? ProductViewController {
         seguedViewController.product = product
        }
      }
    }
  }
  
}
