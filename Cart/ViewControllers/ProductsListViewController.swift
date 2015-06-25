//
//  ProductsListViewController.swift
//  Cart
//
//  Created by Miguel Bassila on 6/24/15.
//  Copyright (c) 2015 Miguel Bassila. All rights reserved.
//

import UIKit

let reuseIdentifier = "Cell"

class ProductsListViewController: UICollectionViewController {
  
  var dataSource: [Product]?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Register cell classes
    self.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    
    // Do any additional setup after loading the view.
    getProducts()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func getProducts(productClient: ProductClient = ProductClient()){
    productClient.getAllProducts { [unowned self] (result) in
      switch (result) {
      case let .Error(error):
        self.tryAgainWithMessage(error)
      case let .Value(boxedProducts):
        print(boxedProducts.value)
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
  
  /*
  // MARK: - Navigation
  
  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
  // Get the new view controller using [segue destinationViewController].
  // Pass the selected object to the new view controller.
  }
  */
  
  // MARK: UICollectionViewDataSource
  
  override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
    //#warning Incomplete method implementation -- Return the number of sections
    return 0
  }
  
  
  override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    //#warning Incomplete method implementation -- Return the number of items in the section
    return 0
  }
  
  override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! UICollectionViewCell
    
    // Configure the cell
    
    return cell
  }
  
  // MARK: UICollectionViewDelegate
  
  /*
  // Uncomment this method to specify if the specified item should be highlighted during tracking
  override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
  return true
  }
  */
  
  /*
  // Uncomment this method to specify if the specified item should be selected
  override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
  return true
  }
  */
  
  /*
  // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
  override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
  return false
  }
  
  override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
  return false
  }
  
  override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
  
  }
  */
  
}
