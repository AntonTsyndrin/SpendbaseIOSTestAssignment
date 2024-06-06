//
//  TransactionView.swift
//  SpendbaseIOSTestAssignment
//
//  Created by Антон Циндрін on 05.06.2024.
//

import SwiftUI

struct TransactionView: View {
    
    let transaction: Transaction
    let currency: Currency
    
    var body: some View {
        
        HStack {
            transactionImageHodlerView
            transactionMerchantView
            Spacer()
            amountTextView
            fileView
        }
        .frame(height: 58)
    }

    private var fileView: some View {
        Group {
            if transaction.status == .completed {
                Image(.cancelSubscription)
                    .frame(width: 20, height: 20)
            }
            else {
                Spacer()
                    .frame(width: 28, height: 20)
            }
        }
        .padding(.trailing, 16)
    }

    private var transactionMerchantView: some View {
        Group {
            if transaction.tribeTransactionType == .topup {
                Text(transaction.status == .pending ? "Load" : transaction.merchantName)
                    .fontWeight(.semibold)
                    .frame(height: 20)
            }
            else {
                VStack(alignment: .leading) {
                    Text(transaction.status == .pending ? "load" : transaction.merchantName)
                        .fontWeight(.semibold)
                        .frame(height: 20)
                    HStack(spacing: 5) {
                        Text("● ●")
                            .font(.system(size: 6))
                            .foregroundStyle(.secondary)
                        Text(transaction.pan.suffix(4))
                            .fontWeight(.semibold)
                            .frame(height: 17)
                            .foregroundStyle(.secondary)
                    }
                }
            }
        }
    }
    
    private var transactionImageHodlerView: some View {
        Group {
            if transaction.status == .deeclined {
                ZStack(alignment: .bottomTrailing) {
                    transactionImageView
                    transactionBadgeView
                }
            }
            else {  transactionImageView  }
        }
    }
    
    
    private var transactionImageView: some View {
        ZStack {
            Circle()
                .fill(.athensGray)
                .frame(width: 40, height: 40)
            transaction.tribeTransactionType.image
                .frame(width: 14, height: 14)

        }
        .padding(.leading, 16)
    }
    
    private var transactionBadgeView: some View {
        Circle()
           .fill(.roman)
           .frame(width: 12, height: 12)
    }
    
    private var amountTextView: some View {
        Text((transaction.tribeTransactionType != .topup ? "-" : "") + (Double(transaction.amount)?.formatted(.currency(code: currency.rawValue)) ?? transaction.amount))
            .fontWeight(.semibold)
            .frame(height: 20)
            .foregroundStyle(statusColor)
    }
    
    private var statusColor: some ShapeStyle {
        if transaction.status == .deeclined { Color.gray }
        else if transaction.tribeTransactionType == .topup { Color.green }
        else { Color.black }
    }
}

#Preview {
    TransactionView(transaction: .preview, currency: .euro)
}
