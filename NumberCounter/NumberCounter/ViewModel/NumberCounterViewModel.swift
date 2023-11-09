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
  @Published var changeValue: String
  
  init(
    totalValue: Int = 0,
    countValue: Int = 10,
    changeValue: String = ""
  ) {
    self.totalValue = totalValue
    self.countValue = countValue
    self.changeValue = changeValue
  }
  
  func getType(_ type: StateType) -> String {
    switch type {
    case .plus: return type.value
    case .minus: return type.value
    case .reset: return type.value
    }
  }
  
  func plus() {
    totalValue += countValue
  }
  
  func minus() {
    totalValue -= countValue
  }
  
  func reset() {
    totalValue = 0
  }
  
  func changeCountValue() {
    if let value = Int(changeValue) {
      countValue = value
      changeValue = ""
    }
  }
}
