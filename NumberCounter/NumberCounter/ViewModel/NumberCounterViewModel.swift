//
//  NumberCounterViewModel.swift
//  NumberCounter
//
//  Created by mingmac on 2023/11/09.
//

import SwiftUI

final class NumberCounterViewModel: ObservableObject {
  @Published var totalValue: Int
  @Published var countValue: Int
  
  init(
    totalValue: Int = 0,
    countValue: Int = 10
  ) {
    self.totalValue = totalValue
    self.countValue = countValue
  }
  
  func getType(_ type: StateType) -> String {
    switch type {
    case .plus: return type.value
    case .minus: return type.value
    }
  }
  
  func plus() {
    totalValue += countValue
  }
  
  func minus() {
    totalValue -= countValue
  }
}
