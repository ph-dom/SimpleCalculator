//
//  CalculatorButton.swift
//  SimpleCalculator
//
//  Created by Pablo Henriquez on 21-04-22.
//

import SwiftUI

struct CalculatorButton: View {
    @EnvironmentObject var calculator: CalculatorData
    var color: Color = .gray
    var nombre: String = ""
    
    var body: some View {
        Button (
            action: {
                print(nombre)
                switch nombre {
                    case "AC":
                        calculator.value = "0"
                        calculator.prevValue = ""
                        calculator.memory = ""
                        calculator.prevActionKey = "init"
                    case "0","1","2","3","4","5","6","7","8","9",",":
                        if calculator.value == " " && nombre == "," {
                            calculator.value = "0,"
                            break
                        }
                        if calculator.value == " " && nombre == "0" {
                            calculator.value = "0,"
                            break
                        }
                        if calculator.value == " " && nombre != "0" && nombre != "," {
                            calculator.value = nombre
                            break
                        }
                        if calculator.value == "0" && nombre == "," {
                            calculator.value += nombre
                            break
                        }
                        if calculator.value == "0" && nombre == "0" {
                            break
                        }
                        if calculator.value == "0" && nombre != "0" && nombre != "," {
                            calculator.value = nombre
                            break
                        }
                        if nombre == "," && nombre.contains(",") {
                            break
                        }
                        calculator.value += nombre
                    case "+","-","×","÷":
                        calculator.prevValue = calculator.value
                        calculator.value = " "
                        calculator.prevActionKey = nombre
                    case "=":
                        let a : Float = Float(calculator.prevValue.replacingOccurrences(of: ",", with: "."))!
                        let b : Float = Float(calculator.value.replacingOccurrences(of: ",", with: "."))!
                        switch calculator.prevActionKey {
                            case "+":
                                calculator.value = String(a + b)
                            case "-":
                                calculator.value = String(a - b)
                            case "×":
                                calculator.value = String(a * b)
                            case "÷":
                                calculator.value = String(a / b)
                            default:
                                print("me quiero morir")
                        }
                        
                    default:
                        print("paso por default")
                }
            },
            label: {
                Text(self.nombre)
                    .font(Font.custom("Helvetica", size: 48))
            }
        )
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .foregroundColor(.white)
        .buttonStyle(.plain)
        .background(self.color)
        
    }
}

struct CalculatorButton_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorButton()
    }
}
