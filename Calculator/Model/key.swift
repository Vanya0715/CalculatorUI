//
//  key.swift
//  Calculator
//
//  Created by Divyansh Dwivedi on 02/05/22.
//

import Foundation
import SwiftUI

enum KeyType {
    case Operator
    case Number
}

struct Key: Identifiable {
    var id: UUID = UUID ()
    var label: String
    var color: Color = Color("NumberColor")
    var labelColor: Color = Color.black
    var keyType: KeyType = KeyType.Number
}

var operatorSymbols: [String:String] = [
    "+" : "plus",
    "-" : "minus",
    "+/-" : "plus.slash.minus",
    "*" : "multiply",
    "/" : "divide",
    "%" : "percent",
    "=" : "equal"
]
