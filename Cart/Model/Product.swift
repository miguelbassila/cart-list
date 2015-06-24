//
//  Product.swift
//  Cart
//
//  Created by Miguel Bassila on 6/23/15.
//  Copyright (c) 2015 Miguel Bassila. All rights reserved.
//

import Foundation

public class Product {

  let id: String
  let name: String
  let price: Price
  let image: NSURL?
  var description: String?
  
  init(id: String, name: String, price: Int, image: String){
    self.id = id
    self.name = name
    self.price = Price(amount: price)
    self.image = NSURL(string: image)
  }
}
