//
//  ContentView.swift
//  SimpleCalculator
//
//  Created by Pablo Henriquez on 19-04-22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var calculator: CalculatorData;
    
    var body: some View {
        VStack(alignment: .trailing) {
            HStack {
                Spacer()
                Result(result: calculator.displayValue)
            }
            .frame(maxWidth: .infinity)
            HStack {
                Button(
                    action: {
                        calculator.displayValue = ""
                        calculator.result = 0
                        calculator.value = 0
                        calculator.prevValue = 0
                        calculator.memory = 0
                        calculator.prevActionKey = "init"
                    },
                    label: {
                        ButtonText(title: "AC", color: .yellow.opacity(0.8))
                    }
                )
                Button(
                    action: {
                        if calculator.displayValue.starts(with: "-") {
                            calculator.displayValue = calculator.displayValue.replacingOccurrences(of: "-", with: "")
                        } else {
                            calculator.displayValue = "-" + calculator.displayValue
                        }
                    },
                    label: {
                        ButtonText(title: "±", color: .yellow.opacity(0.8))
                    }
                )
                Button(
                    action: {},
                    label: {
                        ButtonText(title: "%", color: .yellow.opacity(0.8))
                    }
                )
                Button(
                    action: {
                        calculator.prevValue = Float(calculator.displayValue)!;
                        calculator.displayValue = "";
                        calculator.prevActionKey = "÷";
                    },
                    label: {
                        ButtonText(title: "÷", color: .indigo)
                    }
                )
            }
            HStack {
                Button(
                    action: {
                        calculator.displayValue += "7"
                    },
                    label: {
                        ButtonText(title: "7", color: .gray)
                    }
                )
                Button(
                    action: {
                        calculator.displayValue += "8"
                    },
                    label: {
                        ButtonText(title: "8", color: .gray)
                    }
                )
                Button(
                    action: {
                        calculator.displayValue += "9"
                    },
                    label: {
                        ButtonText(title: "9", color: .gray)
                    }
                )
                Button(
                    action: {
                        calculator.prevValue = Float(calculator.displayValue)!;
                        calculator.displayValue = "";
                        calculator.prevActionKey = "×";
                    },
                    label: {
                        ButtonText(title: "×", color: .indigo)
                    }
                )
            }
            HStack {
                Button(
                    action: {
                        calculator.displayValue += "4"
                    },
                    label: {
                        ButtonText(title: "4", color: .gray)
                    }
                )
                Button(
                    action: {
                        calculator.displayValue += "5"
                    },
                    label: {
                        ButtonText(title: "5", color: .gray)
                    }
                )
                Button(
                    action: {
                        calculator.displayValue += "6"
                    },
                    label: {
                        ButtonText(title: "6", color: .gray)
                    }
                )
                Button(
                    action: {
                        calculator.prevValue = Float(calculator.displayValue)!;
                        calculator.displayValue = "";
                        calculator.prevActionKey = "-";
                    },
                    label: {
                        ButtonText(title: "-", color: .indigo)
                    }
                )
            }
            HStack {
                Button(
                    action: {
                        calculator.displayValue += "1"
                    },
                    label: {
                        ButtonText(title: "1", color: .gray)
                    }
                )
                Button(
                    action: {
                        calculator.displayValue += "2"
                    },
                    label: {
                        ButtonText(title: "2", color: .gray)
                    }
                )
                Button(
                    action: {
                        calculator.displayValue += "3"
                    },
                    label: {
                        ButtonText(title: "3", color: .gray)
                    }
                )
                Button(
                    action: {
                        calculator.prevValue = Float(calculator.displayValue)!;
                        calculator.displayValue = "";
                        calculator.prevActionKey = "+";
                    },
                    label: {
                        ButtonText(title: "+", color: .indigo)
                    }
                )
            }
            HStack {
                Button(
                    action: {},
                    label: {
                        ButtonText(title: "M", color: .yellow.opacity(0.8))
                    }
                )
                Button(
                    action: {
                        if calculator.displayValue != "0" {
                            calculator.displayValue += "0"
                        }
                    },
                    label: {
                        ButtonText(title: "0", color: .gray)
                    }
                )
                Button(
                    action: {
                        if calculator.displayValue.firstIndex(of: ".") == nil {
                            calculator.displayValue += "."
                        }
                    },
                    label: {
                        ButtonText(title: ".", color: .gray)
                    }
                )
                Button(
                    action: {
                        calculator.value = Float(calculator.displayValue)!;
                        switch calculator.prevActionKey {
                            case "+":
                                calculator.result = calculator.prevValue + calculator.value;
                            case "-":
                                calculator.result = calculator.prevValue - calculator.value;
                            case "×":
                                calculator.result = calculator.prevValue * calculator.value;
                            case "÷":
                                calculator.result = calculator.prevValue / calculator.value;
                            default:
                                print("me quiero morir")
                        }
                        calculator.displayValue = String(calculator.result)
                        
                    },
                    label: {
                        ButtonText(title: "=", color: .indigo)
                    }
                )
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
        Text("\(formatResult(displayValue: result))")
            .font(Font.custom("Helvetica", size: 54))
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, maxHeight: 56, alignment: .trailing)
    }
}

func formatResult(displayValue: String) -> String {
    if displayValue == "0.0" {
        return "0";
    } else if displayValue.hasSuffix(".0") {
        return displayValue.replacingOccurrences(of: ".0", with: "");
    } else {
        return "\(displayValue)";
    }
}


