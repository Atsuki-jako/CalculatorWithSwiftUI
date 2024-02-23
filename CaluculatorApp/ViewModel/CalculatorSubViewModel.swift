//
//  CalculatorViewModel.swift
//  CalculatorApp
//
//  Created by Atsuki Jako on 2023-11-30.
//

import Foundation
import SwiftUI

class CalculatorSubViewModel: ObservableObject {
    @Published var caluculatorModel = CalculatorModel()
    @Published var backgroundColor: Color = .black
    @Published var displayValue = CalculatorModel.displayValue
    
    func calculation(_ button: KeyPad) {
        caluculatorModel.operationButtonAction(operation: button)
        displayValue = CalculatorModel.displayValue
    }
}
