//
//  ContentView.swift
//  NumberCounter
//
//  Created by mingmac on 2023/11/09.
//

import SwiftUI

struct ContentView: View {
  @EnvironmentObject private var viewModel: NumberCounterViewModel
  
    var body: some View {
      MainView(viewModel: viewModel)
        .environmentObject(NumberCounterViewModel())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        .environmentObject(NumberCounterViewModel())
    }
}
