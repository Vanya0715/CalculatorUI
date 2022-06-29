//
//  ResultView.swift
//  Calculator
//
//  Created by Divyansh Dwivedi on 02/05/22.
//

import SwiftUI

struct ResultView: View {
    @EnvironmentObject var calculatorVM : CalcVM
    @State private var changeColor = false
    @State private var blur: CGFloat = 5
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                RoundedRectangle(cornerRadius: 16)
                    .foregroundColor(changeColor ? Color.accentColor : Color.clear)
                    .scaleEffect(changeColor ? 1.5 : 1.0)
                    .frame(width: 350, height: 280, alignment:.center)
                    .modifier(NeonEffect(color: Color("NumberColor"), blurRadius: $blur))
                    .animation(Animation.easeInOut.speed(0.17).repeatForever()).onAppear {
                                self.blur = 20
                            self.changeColor.toggle()
                        }
                    .overlay(
                                Text(calculatorVM.result)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: CGFloat(calculatorVM.fontSize)))
                                    .padding(.trailing, 30)
                            )
                }
        }
    }
}

struct NeonEffect: ViewModifier {
    let color: Color
    @Binding var blurRadius: CGFloat
    
    func body(content: Content) -> some View {
        return ZStack {
            content.foregroundColor(color)
            content.blur(radius: blurRadius)
        }
        .padding(10)
        .overlay(RoundedRectangle(cornerRadius: 16,style: .continuous).stroke(color, lineWidth: 8))
        .background(RoundedRectangle(cornerRadius:  16, style: .continuous).stroke(color, lineWidth: 8).brightness(0.4).blur(radius: blurRadius))
        .background(RoundedRectangle(cornerRadius:  16, style: .continuous).stroke(color, lineWidth: 8).brightness(0.4).blur(radius: blurRadius).opacity(0.8))
        .compositingGroup()
    }
}

struct AnimationStyle: PreviewProvider {
    static var previews: some View {
        ResultView()
    }
}
