//
//  ProductListFlowDelegate.swift
//  Cart
//
//  Created by Miguel Bassila on 6/25/15.
//  Copyright (c) 2015 Miguel Bassila. All rights reserved.
//

import UIKit

extension ProductsListViewController : UICollectionViewDelegateFlowLayout
{
  // MARK: - UICollectionViewDelegateFlowLayout
  func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
    let width = (CGRectGetWidth(self.collectionView!.frame) / 2) - 20
    var height: CGFloat?
    if UIApplication.sharedApplication().statusBarOrientation != UIInterfaceOrientation.Portrait {
      height = CGRectGetHeight(self.collectionView!.frame) - 20
    } else {
      height = (CGRectGetHeight(self.collectionView!.frame) / 3) - 20
    }
    return CGSizeMake(width, height!)
  }
}