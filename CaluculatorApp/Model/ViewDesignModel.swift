//
//  ViewDesignModel.swift
//  CalculatorApp
//
//  Created by Atsuki Jako on 2023-11-30.
//

import Foundation
import SwiftUI

struct ViewDesignModel {
    //Button
    static let cornerRadious: CGFloat = 40
    static let buttonFrame: CGFloat = 80
    static let buttonFontzise: CGFloat = 30
    static let fontColor: Color = .primary
    
    //Display
    static let displayFrame: CGFloat = 250
    static let displayFontzise: CGFloat = 80
    static let displayfontColor: Color = .white
    static let displayLineLimit: Int = 1
    
    static func buttonColor(keypads: KeyPad) -> UIColor {
        switch keypads {
        case .zero, .one, .two, .three, .four, .five, .six, .seven, .eight, .nine, .decimal, .color:
            return .systemGray3
        case .add, .subtract, .multiply, .divide, .equal:
            return .orange
        case .negative, .ac, .percent:
            return .gray
        }
    }
}
