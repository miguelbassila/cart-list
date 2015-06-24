//
//  JSON.swift
//  Cart
//
//  Created by Miguel Bassila on 6/24/15.
//  Copyright (c) 2015 Miguel Bassila. All rights reserved.
//

import Foundation

typealias JSON = AnyObject
typealias JSONArrayDictionary = [[String: JSON]]
typealias JSONDictionary = [String: JSON]

func JSONObject(object: JSON?) -> JSONDictionary? {
  return object as? JSONDictionary
}

func JSONArrayObject(object: JSON?) -> JSONArrayDictionary? {
  return object as? JSONArrayDictionary
}

func JSONString(object: JSON?) -> String? {
  return object as? String
}

func JSONInt(object: JSON?) -> Int? {
  return object as? Int
}