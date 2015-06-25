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
  }
  
  override func viewWillAppear(animated: Bool) {
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
  
  /*
  // MARK: - Navigation
  
  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
  // Get the new view controller using segue.destinationViewController.
  // Pass the selected object to the new view controller.
  }
  */
  
}
