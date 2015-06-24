//
//  ProductClient.swift
//  Cart
//
//  Created by Miguel Bassila on 6/23/15.
//  Copyright (c) 2015 Miguel Bassila. All rights reserved.
//

import Foundation
import Alamofire

public struct ProductClient {
  
  public func getAllProducts(completionHandler: (Result<[Product]>) -> ()) {

    let url = NSLocalizedString("url_findAllProducts", comment: "URL to get all products")
    
    Alamofire.request(.GET, url).responseJSON { (request, response, json, error) -> Void in
      if let json = JSONObject(json) {
        if let jsonProducts = JSONArrayObject(json["products"]) {

          var products = [Product]()
          for product in jsonProducts {
            
            /*
             * Would be much cleaner with guards or a JSON library
             */
            
            if let id = JSONString(product["product_id"]),
              let name = JSONString(product["name"]),
              let price = JSONInt(product["price"]),
              let image = JSONString(product["image"]) {
                products.append(Product(id: id, name: name, price: price, image: image))
            }
          }
          
          if products.isEmpty {
            completionHandler(Result.Error("Something went wrong trying to get all products"))
          } else {
            completionHandler(Result.Value(Box(products)))
          }
        }
      }
    }
  }
  
  func getDetailFromProduct() {
    
  }

}
