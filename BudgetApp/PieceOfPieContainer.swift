//
//  PieceOfPieContainer.swift
//  BudgetApp
//
//  Created by Dmitry Gorbunow on 5/3/22.
//

import SwiftUI

class PieceOfPieContainer: ObservableObject {
    @Published var chartData = [
        PieceOfPie(color: Color(#colorLiteral(red: 1, green: 0.8352941176, blue: 0.4470588235, alpha: 1)), percent: 22, value: 0, sum: 1237, categoryName: "Продукты"),
        PieceOfPie(color: Color(#colorLiteral(red: 0.4784313725, green: 0.8274509804, blue: 1, alpha: 1)), percent: 17, value: 0, sum: 946, categoryName: "Автомобиль"),
        PieceOfPie(color: Color(#colorLiteral(red: 0.9960784314, green: 0.4235294118, blue: 0.4235294118, alpha: 1)), percent: 15, value: 0, sum: 503, categoryName: "Развлечения"),
        PieceOfPie(color: Color(#colorLiteral(red: 0.9921568627, green: 0.5843137255, blue: 0.8274509804, alpha: 1)), percent: 15, value: 0, sum: 269, categoryName: "Подарки"),
        PieceOfPie(color: Color(#colorLiteral(red: 0.6, green: 1, blue: 0.6392156863, alpha: 1)), percent: 20, value: 0, sum: 1492, categoryName: "Здоровье"),
        PieceOfPie(color: Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)), percent: 12, value: 0, sum: 854, categoryName: "Спорт")
    ]
    
    func calcOfPath() {
        var value: CGFloat = 0
        
        for index in 0..<chartData.count {
            value += chartData[index].percent
            chartData[index].value = value
        }
    }
    
    func calcPercent() {
        var value: CGFloat = 0
        for index in 0..<chartData.count {
            value += chartData[index].sum
        }
        for index in 0..<chartData.count {
            chartData[index].percent = chartData[index].sum / (value / 100)
            
        }
        
        
        
      
       
    }
    
}
