//
//  MyCardsScreenView.swift
//  SpendbaseIOSTestAssignment
//
//  Created by Антон Циндрін on 05.06.2024.
//

import SwiftUI

struct MyCardsScreenView: View {
    
    var body: some View {
        
        VStack(spacing: 8) {
            Image(.spendbaseLogoPlaceholder)
                .frame(width: 80, height: 80)
            Text("Comming soon")
                .font(.system(size: 15))
                .foregroundStyle(.secondary)
        }
        .navigationTitle("My cards")
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
        .background(.athensGray)
        .toolbar{
            Button(action: {}, label: {
                Image(systemName: "plus")
            })
        }
    }
}

#Preview {
    MyCardsScreenView()
}
