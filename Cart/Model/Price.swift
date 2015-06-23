//
//  Price.swift
//  Cart
//
//  Created by Miguel Bassila on 6/23/15.
//  Copyright (c) 2015 Miguel Bassila. All rights reserved.
//

import Foundation

public struct Price {
  
  private let amount: Int
  
  /* 
   * Public is for testing purposes
   * With Swift 2.0 it is not longer necessary (\0/)
   */
  
  public var formatted: String? {
    let numberFormatter = NSNumberFormatter()
    numberFormatter.numberStyle = .CurrencyStyle
    numberFormatter.currencyCode = "EUR"
    numberFormatter.currencyDecimalSeparator = ","
    
    return numberFormatter.stringFromNumber(Double(amount)/100)
  }
  
  public init(amount: Int?) {
    if let amount = amount {
      self.amount = amount
    } else {
      self.amount = 0
    }
  }
}