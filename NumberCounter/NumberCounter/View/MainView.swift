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
      TitleResetButtonView(viewModel: viewModel)
      
      Spacer()
      
      VStack(alignment: .leading, spacing: 30) {
        TextFieldButtonView(viewModel: viewModel)
          .focused($isFocused)
          .onAppear {
            isFocused = true
          }
        
        CounterTextView(viewModel: viewModel)
        
        HStack(spacing: 30) {
          ButtonActionView(
            type: viewModel.getType(.plus),
            countValue: viewModel.model.countValue,
            color: .green
          ) {
            viewModel.plus()
          }
          
          ButtonActionView(
            type: viewModel.getType(.minus),
            countValue: viewModel.model.countValue,
            color: .red
          ) {
            viewModel.minus()
          }
        }
      }
      
      Spacer()
    }
    .alert(
      "숫자를 입력해주세요.",
      isPresented: $viewModel.isDisplayAlert
    ) {
      Button("확인", role: .cancel) {
        viewModel.model.changeValue = ""
      }
    }
  }
}

private struct TitleResetButtonView: View {
  @ObservedObject var viewModel: NumberCounterViewModel
  
  fileprivate var body: some View {
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
  }
}

private struct TextFieldButtonView: View {
  @ObservedObject var viewModel: NumberCounterViewModel
  
  fileprivate var body: some View {
    HStack {
      TextField(
        "변경할 숫자를 입력해주세요.",
        text: $viewModel.model.changeValue
      )
      .textFieldStyle(.roundedBorder)
      .frame(width: 250)
      .keyboardType(.numberPad)
      
      Button {
        withAnimation {
          viewModel.changeCountValue()
        }
      } label: {
        Text("적용")
          .font(.footnote.bold())
      }
    }
  }
}

private struct CounterTextView: View {
  @ObservedObject var viewModel: NumberCounterViewModel
  
  fileprivate var body: some View {
    HStack {
      Text("Counter: ")
      
      Text("\(viewModel.model.totalValue)")
        .monospacedDigit()
    }
    .font(.title)
  }
}

private struct ButtonActionView: View {
  @State private var isPressed: Bool = false
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
      .scaleEffect(isPressed ? 1.2 : 1)
      .onTapGesture {
        action()
        withAnimation {
          isPressed = true
          DispatchQueue.main.async {
            isPressed = false
          }
        }
      }
  }
}

private struct ResetButtonView: View {
  @State private var isRotated: Bool = false
  let type: String
  let action: () -> Void
  
  fileprivate var body: some View {
    Button {
      withAnimation(.easeInOut) {
        action()
        isRotated.toggle()
      }
    } label: {
      Image(systemName: type)
        .resizable()
        .scaledToFit()
        .frame(width: 30, height: 30)
        .foregroundColor(.blue)
        .rotationEffect(.degrees(isRotated ? 360 : 0))
    }
    .buttonStyle(ScaleEffectButtonStyle())
  }
}

struct ScaleEffectButtonStyle: ButtonStyle {
  func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .scaleEffect(configuration.isPressed ? 0.8 : 1)
  }
}

struct MainView_Previews: PreviewProvider {
  static var previews: some View {
    MainView(viewModel: NumberCounterViewModel())
  }
}
