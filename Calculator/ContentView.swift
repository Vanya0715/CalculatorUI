//
//  ContentView.swift
//  Calculator
//
//  Created by Divyansh Dwivedi on 02/05/22.
//

import SwiftUI

struct ContentView: View {
    var calculatorVM = CalcVM()

    var body: some View {
        ZStack {
                Image("background")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            VStack {
                ResultView()
                KeypadView()
            }.environmentObject(calculatorVM)
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
