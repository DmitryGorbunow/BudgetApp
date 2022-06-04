//
//  ContentView.swift
//  BudgetApp
//
//  Created by Dmitry Gorbunow on 5/3/22.
//

import SwiftUI





struct DonutChart: View {
    @ObservedObject var chartDataObj = PieceOfPieContainer()
    @State private var indexOfTappedSlice = -1
    @State private var showAdd = false
    
    var body: some View {
       
        VStack(alignment: .center, spacing: 22) {
                Image("Top")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 370, height: 153)
                chartDonutView
                    .frame(width: 200, height: 230)
                    .padding()
                    .onAppear() {
                        self.chartDataObj.calcOfPath()
                    }
            HStack {
//                Button {
//                    self.showAdd.toggle()
//                } label: {
//                    Image("Add")
//                } .sheet(isPresented: $showAdd) {
//                    My()
//                }
                NavigationLink(destination: My()) {
                    Text("Hello")
                }

            }
            .frame(width: 300, height: 1, alignment: .trailing)
                
            ScrollView(.vertical, showsIndicators: false) {
                   chartListView
                }
                .frame(width: 331, height: 165, alignment: .center)
                .padding()
                HStack (alignment: .center, spacing: 25 ) {
                    Image("Group 870")
                    Button {
                        self.showAdd.toggle()
                    } label: {
                        Image("Group 869")
                    } .sheet(isPresented: $showAdd) {
                        
                    }
                    
                    Image("Group 868")
                    Image("Group 867")
                }
                .frame(width: 360, height: 90)
                
            }
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}



// MARK: - Private Properties
extension DonutChart {
    private var chartDonutView: some View {
        ZStack {
            ForEach(0..<chartDataObj.chartData.count) { index in
                Circle()
                    .trim(from: index == 0 ? 0.0 : chartDataObj.chartData[index - 1].value / 100,
                          to: chartDataObj.chartData[index].value / 100)
                    .stroke(chartDataObj.chartData[index].color, lineWidth: index % 2 == 0 ? 60 : 40)
                    .scaleEffect(index == indexOfTappedSlice ? 1.1 : 1.0)
                    .animation(.spring())
                    
            }
            if indexOfTappedSlice != -1 {
                Text("₽ " + String(format: "%.0f",
                            Double(chartDataObj.chartData[indexOfTappedSlice].sum)))
                    .font(Font.custom("Spartan", size: 30))
                    .foregroundColor(Color(red:0.39, green:0.39, blue:0.40))
            } else {
                Text("₽ 4524")
                    .font(Font.custom("Spartan", size: 30))
                    .foregroundColor(Color(red:0.39, green:0.39, blue:0.40))
            }
        }
    }
    
    private var chartListView: some View {
        ForEach(0..<chartDataObj.chartData.count) { index in
            

            HStack {
                VStack {
                        Text(chartDataObj.chartData[index].categoryName)
                        .foregroundColor(Color(red:0.39, green:0.39, blue:0.40))
                        .font(Font.custom("Spartan", size: 17))

                    }
                .frame(width: 150, alignment: .leading)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 50)
                        .fill(chartDataObj.chartData[index].color)
                        .frame(width: chartDataObj.chartData[index].percent * 5, height: 30)
                        .onTapGesture {
                            indexOfTappedSlice = indexOfTappedSlice == index ? -1 : index
                        }
                        .scaleEffect(index == indexOfTappedSlice ? 1.1 : 1.0)
                    Text(String(Int(chartDataObj.chartData[index].sum)))
                        .foregroundColor(Color(#colorLiteral(red: 255, green: 255, blue: 255, alpha: 255)))
                        .frame(width: chartDataObj.chartData[index].percent * 5 - 20, height: 30, alignment: .leading)
                        
                }
                .frame(width: 150, alignment: .leading)
            }
            .frame(width: 350, alignment: .trailing)
            }
        }
    }



struct DonutChart_Previews: PreviewProvider {
    static var previews: some View {
        DonutChart().previewDevice(PreviewDevice(rawValue: "iPhone 11 Pro"))
    }
}

