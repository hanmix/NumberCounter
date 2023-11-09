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
  @Published var isDisplayAlert: Bool
  
  init(
    totalValue: Int = 0,
    countValue: Int = 10,
    changeValue: String = "",
    isDisplayAlert: Bool = false
  ) {
    self.totalValue = totalValue
    self.countValue = countValue
    self.changeValue = changeValue
    self.isDisplayAlert = isDisplayAlert
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
  
  func setIsDisplayAlert(_ isDisplay: Bool) {
    isDisplayAlert = isDisplay
  }
  
  func changeCountValue() {
    let regexString = /^[0-9]{1,}/
    
    if !changeValue.contains(regexString) || changeValue.isEmpty {
      setIsDisplayAlert(true)
    } else {
      if let value = Int(changeValue) {
        countValue = value
        changeValue = ""
      }
    }
  }
}
