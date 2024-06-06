//
//  MainScreenView.swift
//  SpendbaseIOSTestAssignment
//
//  Created by Антон Циндрін on 05.06.2024.
//

import SwiftUI

struct HomeScreenView: View {
    
    @State var viewModel: ViewModel
    
    @State private var showingSheet = false
        
    init(with temaModel: MockTeamModel) {
        self.viewModel = ViewModel(temaId: temaModel.id, currency: temaModel.currency)
    }
    
    var body: some View {
        
        ScrollView {
            VStack(spacing: 24) {
                BalanceView(currency: viewModel.currency, balance: viewModel.balance?.value ?? 0.0)
                    .redacted(reason: viewModel.balance == nil ? .placeholder : [])
                MyCardsView(cards: viewModel.cards ?? [])
                    .redacted(reason: viewModel.cards == nil ?  /*@START_MENU_TOKEN@*/.placeholder/*@END_MENU_TOKEN@*/ : [])
                RecentTransactionsView(transactions: viewModel.transactions ?? [], currency: .euro)
                    .redacted(reason: viewModel.transactions == nil ?  .placeholder : [])
                Spacer()
            }
            .padding(16)
            .navigationTitle( "Money")
            .toolbar {
                Button {
                    showingSheet = true
                } label: {
                    Image(systemName: "plus")
                }
                .disabled(viewModel.balance == nil)
            }

        }
        .sheet(isPresented: $showingSheet) {
            TransferScreenView(currency: viewModel.currency, balance: $viewModel.balance)
        }
        .background(.athensGray)
        .task {
            try? await viewModel.fetchData()
        }
    }
}

#Preview {
    HomeScreenView(with: MockTeamModel(id: "mockId", currency: .euro))
}
