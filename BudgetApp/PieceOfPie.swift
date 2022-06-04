//
//  PieceOfPie.swift
//  BudgetApp
//
//  Created by Dmitry Gorbunow on 5/3/22.
//

import SwiftUI

struct PieceOfPie {
    let id = UUID()
    let color: Color
    var percent: CGFloat
    var value: CGFloat
    var sum: CGFloat
    var categoryName: String
}
