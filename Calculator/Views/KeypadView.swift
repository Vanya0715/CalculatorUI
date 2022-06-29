//
//  KeypadView.swift
//  Calculator
//
//  Created by Divyansh Dwivedi on 02/05/22.
//

import SwiftUI

struct KeypadView: View {
    @EnvironmentObject var calculatorVM : CalcVM
    
    var body: some View {
        let keys: [ [Key]] = calculatorVM.getKeys()
        
        return VStack(spacing: 10) {
            ForEach(0 ..<  keys.count) { index in
                HStack(spacing: 8) {
                    ForEach(0 ..< keys[index].count) {
                        inIndex in KeyView(key: keys[index][inIndex])
                    }
                }
            }
            Spacer()
        }
    }
}



