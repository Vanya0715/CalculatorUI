//
//  KeyView.swift
//  Calculator
//
//  Created by Divyansh Dwivedi on 02/05/22.
//

import SwiftUI

struct KeyView: View {
    var key: Key
    @EnvironmentObject var calculatorVM: CalcVM
    
    var body: some View {
        let width = key.label == "0" ? UIScreen.main.bounds.width / 2 : UIScreen.main.bounds.width / 4
        let height = UIScreen.main.bounds.width / 4
        
        return Button(action: {
            self.calculatorVM.handleKeyPress(key: key)
        }) {
            RoundedRectangle(cornerRadius: 200)
                .foregroundColor(key.color)
                .frame(width: width - 10, height: height - 10, alignment: .center)
                .shadow(color: Color("shadow"),
                        radius: 30,
                        x: 0,
                        y: 20)
                .overlay(
                    Group {
                        if (key.keyType == KeyType.Number) {
                            Text(key.label)
                                .foregroundColor(key.labelColor).font(.system(size: 40))
                                .padding(.trailing, self.key.label == "0" ? width - 112 : 0)
                        } else {
                            Image(systemName: operatorSymbols[key.label] ?? "add")
                                .font(.system(size: 30))
                                .foregroundColor(key.labelColor)
                        }
                    }
                )
        }
    }
}
                      
                      
