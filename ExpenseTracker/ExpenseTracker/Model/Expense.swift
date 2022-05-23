//
//  Expense.swift
//  ExpenseTracker
//
//  Created by Dustin yang on 5/21/22.
//


import SwiftUI

// MARK: Expense Model And Sample Data
struct Expense: Identifiable,Hashable{
    var id = UUID().uuidString
    var remark: String
    var amount: Double
    var date: Date
    var type: ExpenseType
    var color: String
 }

enum ExpenseType: String{
    case income = "수입"
    case expense = "지출"
    case all = "전체"
}

var sample_expenses: [Expense] = [
    Expense(remark: "송송김밥", amount: 13, date: Date(timeIntervalSince1970: 1652987245), type: .expense, color: "Yellow"),
    Expense(remark: "Food", amount: 19, date: Date(timeIntervalSince1970: 1652814445), type: .expense, color: "Red"),
    Expense(remark: "월급", amount: 40000, date: Date(timeIntervalSince1970: 1652382445), type: .income, color: "Purple"),
    Expense(remark: "Uber", amount: 20, date: Date(timeIntervalSince1970: 1652296045), type: .expense, color: "Green"),
    Expense(remark: "Amazon Purchase", amount: 299, date: Date(timeIntervalSince1970: 1652209645), type: .expense, color: "Yellow"),
    Expense(remark: "코인", amount: 2599, date: Date(timeIntervalSince1970: 1652036845), type: .income, color: "Purple"),
    Expense(remark: "In App Purchase", amount: 499, date: Date(timeIntervalSince1970: 1651864045), type: .income, color: "Red"),
    Expense(remark: "Movie Ticket", amount: 99, date: Date(timeIntervalSince1970: 1651691245), type: .expense, color: "Yellow"),
    Expense(remark: "Apple Music", amount: 25, date: Date(timeIntervalSince1970: 1651518445), type: .expense, color: "Green"),
    Expense(remark: "Snacks", amount: 49, date: Date(timeIntervalSince1970: 1651432045), type: .expense, color: "Purple"),
]
