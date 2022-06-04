//
//  Expense.swift
//  BudgetApp
//
//  Created by Dmitry Gorbunow on 6/3/22.
//

import SwiftUI

struct ExpenseItem {
    let name: String
    let type: String
    let amount: Int
}

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]()
    
}

struct Expense: View {
    
    @ObservedObject var  expenses = Expenses()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items, id: \.name) {item in
                    Text(item.name)
                    
                }
            }
            .navigationBarTitle("Все операции")
            .navigationBarItems(trailing:
                                    Button(action: {
                let expese = ExpenseItem(name: "Test", type: "", amount: 50)
                self.expenses.items.append(expese)
            }) {
                Image(systemName: "plus")
            })
        }
    }
}

struct Expense_Previews: PreviewProvider {
    static var previews: some View {
        Expense()
    }
}
