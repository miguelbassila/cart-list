//
//  ProductViewCell.swift
//  Cart
//
//  Created by Miguel Bassila on 6/24/15.
//  Copyright (c) 2015 Miguel Bassila. All rights reserved.
//

import UIKit
import Kingfisher

class ProductViewCell: UICollectionViewCell {
  
  @IBOutlet weak private var productImageView: UIImageView!
  @IBOutlet weak private var productName: UILabel!
  @IBOutlet weak private var productPrice: UILabel!
  
  func configureCellWithProduct(product: Product) {
    productName.text = product.name
    productPrice.text = product.price.formatted
    
    if let imageURL = product.image {
      productImageView.kf_setImageWithURL(imageURL)
    }
  }
}
