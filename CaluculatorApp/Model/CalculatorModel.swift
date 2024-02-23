//
//  CalculatorModel.swift
//  CalculatorApp
//
//  Created by Atsuki Jako on 2023-11-30.
//

import Foundation
import SwiftUI

class CalculatorModel: Identifiable {
    var id = UUID()
    let buttons: [[KeyPad]] = [
        [.ac, .negative, .percent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .subtract],
        [.one, .two, .three, .add],
    ]
    let buttons2: [KeyPad] = [.zero, .decimal, .equal]
    let colors: [BackGroundColor] = [.red, .green, .orange, .black, .pink, .purple, .blue]
    
    static var displayValue = "0"
    var currentValue:Double = 0
    var selectedOperation: OperationButton = .none
    var operationButtonTapped = false
    
    func operationButtonAction(operation: KeyPad) {
        switch operation {
        case .add, .subtract, .multiply, .divide, .equal:
            if operation == .equal {
                calculation()
            }else {
                if selectedOperation != .none {
                    calculation()
                }
                selectedOperation = OperationButton(rawValue: operation.rawValue) ?? .none
                currentValue = Double(CalculatorModel.displayValue.replacingOccurrences(of: ",", with: "")) ?? 0
                CalculatorModel.displayValue = formatOfResult(currentValue)
                operationButtonTapped = true
            }
        case .ac:
            CalculatorModel.displayValue = "0"
        case .decimal:
            if !CalculatorModel.displayValue.contains(".") {
                CalculatorModel.displayValue.append(".")
            }
        case .negative:
            if CalculatorModel.displayValue != "0" {
                if !CalculatorModel.displayValue.hasPrefix("-") {
                    CalculatorModel.displayValue = "-" + CalculatorModel.displayValue
                }else {
                    CalculatorModel.displayValue.removeFirst()
                }
            }
        case .percent:
            if CalculatorModel.displayValue != "0" {
                if let value = Double(CalculatorModel.displayValue) {
                    CalculatorModel.displayValue = "\(value / 100)"
                }
            }
        default:
            let value = operation.rawValue
            if CalculatorModel.displayValue == "0" || operationButtonTapped {
                CalculatorModel.displayValue = value
                operationButtonTapped = false
            } else {
                CalculatorModel.displayValue.append(operation.rawValue)
            }
        }
    }
    
    private func calculation() {
        let inputValue = Double(CalculatorModel.displayValue) ?? 0
        switch selectedOperation {
        case .add: currentValue = currentValue + inputValue
        case .subtract: currentValue = currentValue - inputValue
        case .multiply: currentValue = currentValue * inputValue
        case .divide:
            if inputValue != 0 {
                currentValue = currentValue / inputValue
            }
        case .none: break
        }
        CalculatorModel.displayValue = formatOfResult(currentValue)
        selectedOperation = .none
    }
    
    private func formatOfResult(_ result: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 4
        formatter.groupingSeparator = ","
        
        if result.truncatingRemainder(dividingBy: 1) == 0 {
            return formatter.string(from: NSNumber(value: Int(result))) ?? "0"
        } else {
            return formatter.string(from: NSNumber(value: result)) ?? "0"
        }
    }
}

