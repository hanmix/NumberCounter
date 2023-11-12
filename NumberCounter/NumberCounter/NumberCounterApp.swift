//
//  NumberCounterApp.swift
//  NumberCounter
//
//  Created by mingmac on 2023/11/09.
//

import SwiftUI

@main
struct NumberCounterApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
            .environmentObject(NumberCounterViewModel())
        }
    }
}
