//
//  RecentTransactionsView.swift
//  SpendbaseIOSTestAssignment
//
//  Created by Антон Циндрін on 05.06.2024.
//

import SwiftUI

struct RecentTransactionsView: View {
    
    let transactions: Transactions
    let currency: Currency
    
    var body: some View {
        VStack(spacing: 0) {
            headerView
            transactionsListView
        }
        .background(
            RoundedRectangle(cornerRadius: 14)
                .fill(.white)
        )
    }
    
    private var headerView: some View {
        HStack {
            Text("Recent transactions")
                .font(.headline)
                .padding(.horizontal, 16)
                .padding(.vertical, 9)
            Spacer()
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("See All")
                    .font(.headline)
            })
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
        }
        .frame(height: 40)
        .padding(.top, 2)
    }
    
    private var transactionsListView: some View {
        VStack(spacing: .zero) {
            ForEach(transactions.suffix(3), id: \.id) { transaction in
                TransactionView(transaction: transaction, currency: currency)
            }
        }
        .padding(.bottom, 2)
    }
}

#Preview {
    RecentTransactionsView(transactions: .preview, currency: .euro)
}
