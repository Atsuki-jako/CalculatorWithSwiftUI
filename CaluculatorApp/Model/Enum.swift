//
//  Enum.swift
//  CalculatorApp
//
//  Created by Atsuki Jako on 2023-12-01.
//

import Foundation
import SwiftUI

enum KeyPad: String {
    case zero = "0"
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case ac = "AC"
    case add = "+"
    case subtract = "-"
    case multiply = "×"
    case percent = "%"
    case divide = "/"
    case equal = "="
    case decimal = "."
    case negative = "-/+"
    case color = "Color"
    
}

enum OperationButton: String {
    case add = "+"
    case subtract = "-"
    case multiply = "×"
    case divide = "/"
    case none = ""
}


enum BackGroundColor: String {
    case red = "red"
    case green = "green"
    case orange = "orange"
    case black = "black"
    case purple = "purple"
    case pink = "pink"
    case blue = "blue"
    
    func changeColor() -> Color {
        switch self {
        case .red: return Color.red
        case .green: return Color.green
        case .orange: return Color.orange
        case .black: return Color.black
        case .pink: return Color.pink
        case .purple: return Color.purple
        case .blue: return Color.blue
        }
    }
}
