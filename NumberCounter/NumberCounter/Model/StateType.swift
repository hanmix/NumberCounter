//
//  StateType.swift
//  NumberCounter
//
//  Created by mingmac on 2023/11/09.
//

import Foundation

enum StateType {
  case plus
  case minus
  case reset
  
  var value: String {
    switch self {
    case .plus: return "+"
    case .minus: return "-"
    case .reset: return "reset"
    }
  }
}
