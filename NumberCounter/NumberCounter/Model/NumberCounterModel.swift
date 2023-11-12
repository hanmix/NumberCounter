//
//  NumberCounterModel.swift
//  NumberCounter
//
//  Created by mingmac on 2023/11/09.
//

import Foundation

struct NumberCounterModel {
  var totalValue: Int
  var countValue: Int
  var changeValue: String
  var type: StateType
  
  enum StateType {
    case plus
    case minus
    case reset
    
    var value: String {
      switch self {
      case .plus: return "+"
      case .minus: return "-"
      case .reset: return "arrow.clockwise.circle"
      }
    }
  }
}


