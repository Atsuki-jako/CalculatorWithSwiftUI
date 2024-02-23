//
//  CalculatorSubView.swift
//  CalculatorApp
//
//  Created by Atsuki Jako on 2023-12-01.
//

import SwiftUI

struct CalculatorSubView: View {
    @StateObject var viewModel = CalculatorSubViewModel()
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Text(viewModel.displayValue)
                    .font(.system(size: ViewDesignModel.displayFontzise))
                    .foregroundColor(ViewDesignModel.displayfontColor)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .lineLimit(ViewDesignModel.displayLineLimit)
            }
            ForEach(viewModel.caluculatorModel.buttons, id: \.self) { button in
                HStack {
                    ForEach(button, id: \.self) {item in
                        Button {
                            viewModel.calculation(item)
                        }label: {
                            Text(item.rawValue)
                                .frame(width: ViewDesignModel.buttonFrame, height: ViewDesignModel.buttonFrame)
                                .foregroundColor(ViewDesignModel.fontColor)
                                .background(Color(uiColor: ViewDesignModel.buttonColor(keypads: item)))
                                .cornerRadius(ViewDesignModel.cornerRadious)
                                .font(.system(size: ViewDesignModel.buttonFontzise))
                        }
                    }
                }
            }
            HStack {
                Menu(KeyPad.color.rawValue) {
                    ForEach(viewModel.caluculatorModel.colors, id:\.self) { color in
                        Button {
                            viewModel.backgroundColor = BackGroundColor(rawValue: color.rawValue)?.changeColor() ?? .black
                        }label: {
                            Text(color.rawValue)
                        }
                    }
                }
                .frame(width: ViewDesignModel.buttonFrame, height: ViewDesignModel.buttonFrame)
                .foregroundColor(ViewDesignModel.fontColor)
                .background(Color(uiColor: .systemGray3))
                .cornerRadius(ViewDesignModel.cornerRadious)
                .font(.system(size: ViewDesignModel.buttonFontzise))
                
                ForEach(viewModel.caluculatorModel.buttons2, id: \.self) { button in
                    Button {
                        viewModel.calculation(button)
                    }label: {
                        Text(button.rawValue)
                            .frame(width: ViewDesignModel.buttonFrame, height: ViewDesignModel.buttonFrame)
                            .foregroundColor(ViewDesignModel.fontColor)
                            .background(Color(uiColor: ViewDesignModel.buttonColor(keypads: button)))
                            .cornerRadius(ViewDesignModel.cornerRadious)
                            .font(.system(size: ViewDesignModel.buttonFontzise))
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(viewModel.backgroundColor)
    }
}


struct CaluculatorSubView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorSubView()
    }
}
