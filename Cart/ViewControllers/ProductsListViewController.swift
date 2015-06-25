//
//  ProductsListViewController.swift
//  Cart
//
//  Created by Miguel Bassila on 6/24/15.
//  Copyright (c) 2015 Miguel Bassila. All rights reserved.
//

import UIKit

let reuseIdentifier = "ProductCell"

class ProductsListViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
  
  @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
  
  var dataSource: [Product]?
  var product: Product?
  
  // MARK: - View Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    self.title = NSLocalizedString("title_productList", comment: "View controller title")
  }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    getProducts()
  }
  
  override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
    super.viewWillTransitionToSize(size, withTransitionCoordinator: coordinator)
    collectionView!.collectionViewLayout.invalidateLayout()
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
