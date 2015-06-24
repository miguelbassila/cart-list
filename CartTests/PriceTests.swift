//
//  PriceTests.swift
//  Cart
//
//  Created by Miguel Bassila on 6/23/15.
//  Copyright (c) 2015 Miguel Bassila. All rights reserved.
//

import UIKit
import XCTest
import Cart

class PriceTests: XCTestCase {
  
  func testFormattedPrice() {
    let price = Price(amount: 120)
    if let formattedPrice = price.formatted {
      XCTAssertEqual(formattedPrice, "€1,20")
    }
  }
  
  func testFormattedPriceOnlyDigits() {
    let price = Price(amount: 47)
    if let formattedPrice = price.formatted {
      XCTAssertEqual(formattedPrice, "€0,47")
    }
  }
  
  func testFormattedZeroPrice() {
    let price = Price(amount: 0)
    if let formattedPrice = price.formatted {
      XCTAssertEqual(formattedPrice, "€0,00")
    }
  }
  
  func testFormattedNegativePrice() {
    let price = Price(amount: -200)
    if let formattedPrice = price.formatted {
      XCTAssertEqual(formattedPrice, "€0,00")
    }
  }
}
