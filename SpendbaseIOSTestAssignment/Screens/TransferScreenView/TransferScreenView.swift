//
//  TransferScreenView.swift
//  SpendbaseIOSTestAssignment
//
//  Created by Антон Циндрін on 06.06.2024.
//

import SwiftUI

struct TransferScreenView: View {
    
    var currency: Currency
    @Binding var balance: Balance?

    @State private var inputTransferValue: Int = .zero
    @FocusState private var currencyFieldIsFocused: Bool
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        NavigationStack {
            VStack(alignment: .center) {
                Spacer()
                HStack(alignment: .center, spacing: 4) {
                    Text(Locale.current.localizedCurrencySymbol(forCurrencyCode: currency.rawValue) ?? "")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                    CurrencyTextField(numberFormatter: numberFormatter, value: $inputTransferValue, maxLength: 12)
                        .autocorrectionDisabled(true)
                        .fixedSize()
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                        .fixedSize(horizontal: true, vertical: false)
                        .keyboardType(.numberPad)
                        .focused($currencyFieldIsFocused)
                        .onAppear { currencyFieldIsFocused = true }
                }
                descriptionTextView
                
                Spacer()
                
                Button {
                    balance?.value = (balance?.value ?? .zero) - (Double(inputTransferValue) / 100.0)
                    dismiss()
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 100, style: .continuous)
                            .fill(.lightskyblue)
                            .frame(height: 48)
                        Text("Continue")
                            .foregroundStyle(.athensGray)
                    }
                    .padding(.horizontal, 16)
                    .padding(.bottom, 16)
                    
                }
                .buttonStyle(.plain)
                .disabled((inputTransferValue == .zero) || (balance?.value ?? .zero) < (Double(inputTransferValue) / 100.0))
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .toolbar {
                Button(action: {
                    dismiss()
                }, label: {
                    Image(systemName: "xmark")
                        .foregroundColor(.black)
                })
            }
            .navigationTitle("Transfer")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    
    var numberFormatter: NumberFormatterProtocol  {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.currencySymbol = ""
        numberFormatter.maximumFractionDigits = 2
        numberFormatter.zeroSymbol = ""
        
        return numberFormatter
    }

    
    @ViewBuilder
    private var descriptionTextView: some View {
        if let balance = balance {
            
            let doubleValue = Double(inputTransferValue) / 100.0
            
            if balance.value < doubleValue {
                Text("You only have \(String(describing: balance.value.formatted(.currency(code: currency.rawValue)))) \navailable in your balance")
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.red)
            }
            else {
                Text("You have \(String(describing: balance.value.formatted(.currency(code: currency.rawValue)))) \navailable in your balance")
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
            }
        }
        else {
            Text("Something went wrong,\nplease try again later.")
                .multilineTextAlignment(.center)
                .foregroundStyle(.red)
        }
    }
}

#Preview {
    TransferScreenView(currency: .euro, balance: .constant(.init(value: 153000.85)))
}
