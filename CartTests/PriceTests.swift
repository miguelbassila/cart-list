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
      XCTAssertEqual(formattedPrice, "€1,20", "Should be formatted")
    }
  }
}
