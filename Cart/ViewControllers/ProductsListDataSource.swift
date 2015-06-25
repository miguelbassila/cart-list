//
//  ProductListDataSource.swift
//  Cart
//
//  Created by Miguel Bassila on 6/25/15.
//  Copyright (c) 2015 Miguel Bassila. All rights reserved.
//

import UIKit

extension ProductsListViewController : UICollectionViewDataSource {
  
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