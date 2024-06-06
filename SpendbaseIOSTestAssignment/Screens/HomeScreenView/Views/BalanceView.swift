//
//  BalanceView.swift
//  SpendbaseIOSTestAssignment
//
//  Created by Антон Циндрін on 05.06.2024.
//

import SwiftUI

struct BalanceView: View {
    
    let currency: Currency
    let balance: Double
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 4) {
            currencyView
            Text(balance.formatted(.currency(code: currency.rawValue)))
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/.bold())
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 10)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 14)
                .fill(.white)
        )
    }
    
    private var currencyTitleView: some View {
        Text("\(currency.rawValue) account")
            .foregroundStyle(.secondary)
            .fontWeight(.semibold)
    }
    
    @ViewBuilder
    private var currencyView: some View {
        if let image = currency.image {
            HStack {
                image
                currencyTitleView
            }
        }
        else {
            currencyTitleView
        }
    }
}

#Preview {
    BalanceView(currency: .euro, balance: 153000.85)
}
