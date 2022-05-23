//
//  ExpenseCard.swift
//  ExpenseTracker
//
//  Created by Dustin yang on 5/22/22.
//

import SwiftUI

struct ExpenseCard: View {
    @EnvironmentObject var expenseViewModel: ExpenseViewModel
    var isFilter: Bool = false
    var body: some View {
        // MARK : Expense Gradient CardView
        GeometryReader{proxy in
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(
                    .linearGradient(colors: [
                        Color("Gradient1"),
                        Color("Gradient2"),
                        Color("Gradient3"),
                    ], startPoint: .topLeading, endPoint: .bottomTrailing)
                )
            
            VStack(spacing: 15){
                VStack(spacing: 15){
                    Text(isFilter ? expenseViewModel.convertDateToString() : expenseViewModel.currentMonthDateString())
                        .font(.callout)
                        .fontWeight(.semibold)
                    Text(expenseViewModel.convertExpensesToCurrency(expenses: expenseViewModel.expenses)).font(.system(size: 35, weight: .bold)).lineLimit(1).padding(.bottom, 5)
                    
                }
                .offset(y : -10)
                
                HStack(spacing: 15){
                    Image(systemName: "arrow.down")
                        .font(.caption.bold())
                        .foregroundColor(Color("Green"))
                        .frame(width: 30, height: 30)
                        .background(.white.opacity(0.7),in: Circle())
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("수입")
                            .font(.caption)
                            .opacity(0.7)
                        
                        Text(expenseViewModel.convertExpensesToCurrency(expenses: expenseViewModel.expenses, type: .income))
                            .font(.callout)
                            .fontWeight(.semibold)
                            .lineLimit(1)
                            .fixedSize()
                    }
                    .frame(maxWidth: .infinity,alignment: .leading)
                    
                    Image(systemName: "arrow.up")
                        .font(.caption.bold())
                        .foregroundColor(Color("Red"))
                        .frame(width: 30, height: 30)
                        .background(.white.opacity(0.7),in: Circle())
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("지출")
                            .font(.caption)
                            .opacity(0.7)
                        
                        Text(expenseViewModel.convertExpensesToCurrency(expenses: expenseViewModel.expenses, type: .expense))
                            .font(.callout)
                            .fontWeight(.semibold)
                            .lineLimit(1)
                            .fixedSize()
                    }
                }
                .padding(.horizontal)
                .padding(.trailing)
                .offset(y: 15)
                
            }
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            
        }.frame(height: 220)
            .padding(.top)
    }
}

