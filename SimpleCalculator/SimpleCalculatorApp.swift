//
//  SimpleCalculatorApp.swift
//  SimpleCalculator
//
//  Created by Pablo Henriquez on 19-04-22.
//

import SwiftUI

@main
struct SimpleCalculatorApp: App {
    @StateObject var calculator = CalculatorData()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(calculator)
        }
    }
}

class CalculatorData: ObservableObject {
    @Published var value: String = "0"
    @Published var prevValue: String = ""
    @Published var memory: String = ""
    @Published var prevActionKey: String = "init"
}
