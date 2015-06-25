//
//  ProductViewController.swift
//  Cart
//
//  Created by Miguel Bassila on 6/24/15.
//  Copyright (c) 2015 Miguel Bassila. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController {
  
  @IBOutlet weak var productDescription: UILabel!
  @IBOutlet weak var productPrice: UILabel!
  @IBOutlet weak var productName: UILabel!
  @IBOutlet weak var productImageView: UIImageView!
  
  var product: Product?
  
  // MARK: - View Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    self.title = NSLocalizedString("title_productDetail", comment: "View controller title")
    updateLabels()
  }
  
  // MARK: - Helpers
  func updateLabels() {
    productDescription.text = product?.description
    productPrice.text = product?.price.formatted
    productName.text = product?.name
    
    if let imageURL = product?.image {
      productImageView.kf_setImageWithURL(imageURL)
    }
  }
  
}
