//
//  MainView.swift
//  NumberCounter
//
//  Created by mingmac on 2023/11/09.
//

import SwiftUI

struct MainView: View {
  @StateObject var viewModel: NumberCounterViewModel
  @FocusState private var isFocused: Bool
  
  var body: some View {
    VStack {
      HStack {
        Text("Number Counter")
          .font(.largeTitle.bold())
        
        Spacer()
        
        ResetButtonView(type: viewModel.getType(.reset)) {
          viewModel.reset()
        }
      }
      .padding(.horizontal, 20)
      .padding(.top, 20)
      
      Spacer()
      
      VStack {
        HStack {
          TextField(
            "변경할 숫자를 입력해주세요.",
            text: $viewModel.changeValue
          )
          .textFieldStyle(.roundedBorder)
          .frame(width: 250)
          .focused($isFocused)
          .onAppear {
            isFocused = true
          }
          
          Button {
            viewModel.changeCountValue()
          } label: {
            Text("적용")
              .font(.footnote.bold())
          }
        }
        
        HStack {
          Text("Counter: ")
          
          Text("\(viewModel.totalValue)")
        }
        .font(.title)
        
        HStack(spacing: 30) {
          ButtonActionView(
            type: viewModel.getType(.plus),
            countValue: viewModel.countValue,
            color: .green
          ) {
            viewModel.plus()
          }
          
          ButtonActionView(
            type: viewModel.getType(.minus),
            countValue: viewModel.countValue,
            color: .red
          ) {
            viewModel.minus()
          }
        }
      }
      
      Spacer()
    }
    .alert("숫자를 입력해주세요.", isPresented: $viewModel.isDisplayAlert) {
      Button("확인", role: .cancel) {
        viewModel.changeValue = ""
      }
    }
  }
}

private struct ButtonActionView: View {
  let type: String
  let countValue: Int
  let color: Color
  let action: () -> Void
  
  fileprivate var body: some View {
    Text("\(type)\(countValue)")
      .font(.system(size: 20, weight: .bold))
      .foregroundColor(.white)
      .padding(.horizontal, 15)
      .padding(.vertical, 10)
      .background(
        color,
        in: RoundedRectangle(cornerRadius: 20)
      )
      .onTapGesture {
        action()
      }
  }
}

private struct ResetButtonView: View {
  let type: String
  let action: () -> Void
  
  fileprivate var body: some View {
    Text(type)
      .font(.system(size: 20, weight: .bold))
      .foregroundColor(.blue)
      .frame(width: 70, height: 40)
      .background(
        .blue,
        in: RoundedRectangle(cornerRadius: 10)
          .stroke(lineWidth: 2)
      )
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
