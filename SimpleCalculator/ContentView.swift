//
//  ContentView.swift
//  SimpleCalculator
//
//  Created by Pablo Henriquez on 19-04-22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var calculator: CalculatorData
    var formattedValue: String = "";
    
    var body: some View {
        VStack(alignment: .trailing) {
            HStack {
                Spacer()
                if calculator.value == "0.0" {
                    Result(result: "0")
                } else if calculator.value.hasSuffix(".0") {
                    Result(result: "\(calculator.value.replacingOccurrences(of: ".0", with: ""))")
                } else {
                    Result(result: "\(calculator.value)")
                }
            }
            .frame(maxWidth: .infinity)
            HStack {
                CalculatorButton(color: .yellow.opacity(0.8), nombre: "AC")
                CalculatorButton(color: .yellow.opacity(0.8), nombre: "±")
                CalculatorButton(color: .yellow.opacity(0.8), nombre: "%")
                CalculatorButton(color: .indigo, nombre: "÷")
            }
            HStack {
                CalculatorButton(color: .gray, nombre: "7")
                CalculatorButton(color: .gray, nombre: "8")
                CalculatorButton(color: .gray, nombre: "9")
                CalculatorButton(color: .indigo, nombre: "×")
            }
            HStack {
                CalculatorButton(color: .gray, nombre: "4")
                CalculatorButton(color: .gray, nombre: "5")
                CalculatorButton(color: .gray, nombre: "6")
                CalculatorButton(color: .indigo, nombre: "-")
            }
            HStack {
                CalculatorButton(color: .gray, nombre: "1")
                CalculatorButton(color: .gray, nombre: "2")
                CalculatorButton(color: .gray, nombre: "3")
                CalculatorButton(color: .indigo, nombre: "+")
            }
            HStack {
                CalculatorButton(color: .yellow.opacity(0.8), nombre: "M")
                CalculatorButton(color: .gray, nombre: "0")
                CalculatorButton(color: .gray, nombre: ",")
                CalculatorButton(color: .indigo, nombre: "=")
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static let calculator = CalculatorData()
    
    static var previews: some View {
        Group {
            ContentView().environmentObject(calculator)
        }
    }
}

struct Result: View {
    var result: String = ""
    
    var body: some View {
        Text("\(result)")
            .font(Font.custom("Helvetica", size: 54))
            .foregroundColor(.white)
    }
}


