//
//  NumberCounterModel.swift
//  NumberCounter
//
//  Created by mingmac on 2023/11/09.
//

import Foundation
import SwiftUI

struct NumberCounterModel {
  var totalValue: Double
  var countValue: Double
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
    
    var color: Color {
      switch self {
      case .plus: return .green
      case .minus: return .red
      case .reset: return .blue
      }
    }
  }
}


