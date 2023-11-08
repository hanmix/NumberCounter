//
//  MainView.swift
//  NumberCounter
//
//  Created by mingmac on 2023/11/09.
//

import SwiftUI

struct MainView: View {
  @StateObject var viewModel: NumberCounterViewModel
  
    var body: some View {
      VStack {
        HStack {
          Text("Number Counter")
            .font(.largeTitle.bold())
          
          Spacer()
        }
        .padding(.horizontal, 20)
        .padding(.top, 20)
        
        Spacer()
        
        HStack {
          Text("Counter: ")
          
          Text("\(viewModel.totalValue)")
        }
        .font(.title)
        
        HStack(spacing: 30) {
          ButtonActionView(type: viewModel.getType(.plus), countValue: viewModel.countValue, color: .green) {
            viewModel.plus()
          }
          
          ButtonActionView(type: viewModel.getType(.minus), countValue: viewModel.countValue, color: .red) {
            viewModel.minus()
          }
        }
        
        Spacer()
      }
    }
}

private struct ButtonActionView: View {
  let type: String
  let countValue: Int
  let color: Color
  let action: () -> Void
  
  fileprivate  var body: some View {
    Text("\(type)\(countValue)")
      .font(.system(size: 20, weight: .bold))
      .foregroundColor(.white)
      .padding(.horizontal, 15)
      .padding(.vertical, 10)
      .background(color, in: RoundedRectangle(cornerRadius: 20))
      .onTapGesture {
        action()
      }
  }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
      MainView(viewModel: NumberCounterViewModel())
    }
}
