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
      
      if let _ = error  {
        completionHandler(Result.Error("Something went wrong trying to get all cart products."))
        return
      }
      
      if let json = JSONObject(json) {
        if let jsonProducts = JSONArrayObject(json["products"]) {

          var products = [Product]()
          for product in jsonProducts {
            
            if let id = JSONString(product["product_id"]),
              let name = JSONString(product["name"]),
              let price = JSONInt(product["price"]),
              let image = JSONString(product["image"]) {
                products.append(Product(id: id, name: name, price: price, image: image))
            }
          }
          
          if products.isEmpty {
            completionHandler(Result.Error("The list received was missing information."))
          } else {
            completionHandler(Result.Value(Box(products)))
          }
        }
      }
    }
  }
  
  func getDetailFromProduct(product: Product, completionHandler: (Result<Product>) -> ()) {
    
    let url = NSString.localizedStringWithFormat(NSLocalizedString("url_getProductDetail",  comment:"URL to get product detail"), product.id) as! String
    
    Alamofire.request(.GET, url).responseJSON { (request, response, json, error) -> Void in
      
      if let _ = error  {
        completionHandler(Result.Error("Something went wrong trying to get \(product.name) details"))
        return
      }
      
      var newDescription: String?
      
      if let json = JSONObject(json) {
        if let description = JSONString(json["description"]) {
          newDescription = description
        }
      }
      
      if let productDescription = newDescription {
        product.description = productDescription
        completionHandler(Result.Value(Box(product)))
      } else {
        completionHandler(Result.Error("Something went wrong trying to open \(product.name) details"))
      }
    }
  }

}
