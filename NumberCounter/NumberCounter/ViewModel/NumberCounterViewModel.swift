//
//  NumberCounterViewModel.swift
//  NumberCounter
//
//  Created by mingmac on 2023/11/09.
//

import SwiftUI

final class NumberCounterViewModel: ObservableObject {
  @Published var model: NumberCounterModel
  @Published var isDisplayAlert: Bool
  
  init(
    model: NumberCounterModel = NumberCounterModel(
      totalValue: 0,
      countValue: 10,
      changeValue: "",
      type: .plus
    ),
    isDisplayAlert: Bool = false
  ) {
    self.model = model
    self.isDisplayAlert = isDisplayAlert
  }
  
  func getType(_ type: NumberCounterModel.StateType) -> String {
    switch type {
    case .plus: return type.value
    case .minus: return type.value
    case .reset: return type.value
    }
  }
  
  func plus() {
    model.totalValue += model.countValue
  }
  
  func minus() {
    model.totalValue -= model.countValue
  }
  
  func reset() {
    model.totalValue = 0
  }
  
  func setIsDisplayAlert(_ isDisplay: Bool) {
    isDisplayAlert = isDisplay
  }
  
  func changeCountValue() {
    let regexString = /^[0-9]{1,}+[\.]+[0-9]{1,}$/
//    let regexString2 = /^([\.]?[0-9]){1,}$/
    
    if !model.changeValue.contains(regexString) || model.changeValue.isEmpty {
      setIsDisplayAlert(true)
    } else {
      if let value = Double(model.changeValue) {
        model.countValue = value
        model.changeValue = ""
      }
    }
  }
}
