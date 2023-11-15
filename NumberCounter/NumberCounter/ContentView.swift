//
//  ContentView.swift
//  NumberCounter
//
//  Created by mingmac on 2023/11/09.
//

import SwiftUI

struct ContentView: View {
  @StateObject private var viewModel: NumberCounterViewModel = NumberCounterViewModel()
  
    var body: some View {
      MainView(viewModel: viewModel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
