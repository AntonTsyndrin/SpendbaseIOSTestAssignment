//
//  TransactiosScreenView.swift
//  SpendbaseIOSTestAssignment
//
//  Created by Антон Циндрін on 05.06.2024.
//

import SwiftUI

struct TransactiosScreenView: View {
    
    var body: some View {

        VStack(spacing: 8) {
            Image(.spendbaseLogoPlaceholder)
                .frame(width: 80, height: 80)
            Text("Comming soon")
                .font(.system(size: 15))
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.athensGray)
        .navigationTitle( "Transactios")
    }
}

#Preview {
    TransactiosScreenView()
}
