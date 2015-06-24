//
//  Result.swift
//  Cart
//
//  Created by Miguel Bassila on 6/24/15.
//  Copyright (c) 2015 Miguel Bassila. All rights reserved.
//

import Foundation

/*
 * Hack to store any value to enum
 * With Swift 2.0 it is not longer necessary (\0/)
 * Enum<T1, T2>
 */

public enum Result<A> {
  case Error(String)
  case Value(Box<A>)
}

public final class Box<A> {
  let value: A
  
  init(_ value: A) {
    self.value = value
  }
}
