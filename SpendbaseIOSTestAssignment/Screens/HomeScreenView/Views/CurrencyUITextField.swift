//
//  CurrencyUITextField.swift
//  NumberSample
//
//  Created by Benoit Pasquier on 10/2/22.
//

import Foundation
import UIKit
import SwiftUI

class CurrencyUITextField: UITextField, UITextFieldDelegate {
    @Binding private var value: Int
    private let formatter: NumberFormatterProtocol
    private let maxLength: Int

    init(formatter: NumberFormatterProtocol, value: Binding<Int>, maxLength: Int) {
        self.formatter = formatter
        self._value = value
        self.maxLength = maxLength
        super.init(frame: .zero)
        delegate = self
        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: superview)
        addTarget(self, action: #selector(editingChanged), for: .editingChanged)
        addTarget(self, action: #selector(resetSelection), for: .allTouchEvents)
        keyboardType = .numberPad
        textAlignment = .right
        sendActions(for: .editingChanged)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentString = (textField.text ?? "") as NSString
        let newString = currentString.replacingCharacters(in: range, with: string)

        return newString.count <= maxLength
    }


    override func deleteBackward() {
        text = textValue.digits.dropLast().string
        sendActions(for: .editingChanged)
    }

    private func setupViews() {
        tintColor = .clear
        font = .systemFont(ofSize: 40, weight: .regular)
        self.placeholder = "0"
        setInitialValue()
    }
    
    private func setInitialValue() {
        if value > 0 {
            let val = Double(value)
            let decimalValue = Decimal(val / 100.0)
            text = currency(from: decimalValue)
        }
    }

    @objc private func editingChanged() {
        text = currency(from: decimal)
        resetSelection()
        updateValue()
    }

    @objc private func resetSelection() {
        selectedTextRange = textRange(from: endOfDocument, to: endOfDocument)
    }

    private func updateValue() {
        DispatchQueue.main.async { [weak self] in
            self?.value = self?.intValue ?? 0
        }
    }

    private var textValue: String {
        return text ?? ""
    }

    private var decimal: Decimal {
      return textValue.decimal / pow(10, formatter.maximumFractionDigits)
    }

    private var intValue: Int {
        return NSDecimalNumber(decimal: decimal * 100).intValue
    }

    private func currency(from decimal: Decimal) -> String {
        return formatter.string(for: decimal) ?? ""
    }
}

extension StringProtocol where Self: RangeReplaceableCollection {
    var digits: Self { filter (\.isWholeNumber) }
}

extension String {
    var decimal: Decimal { Decimal(string: digits) ?? 0 }
}

extension LosslessStringConvertible {
    var string: String { .init(self) }
}

protocol NumberFormatterProtocol: AnyObject {
    func string(from number: NSNumber) -> String?
    func string(for obj: Any?) -> String?
    var numberStyle: NumberFormatter.Style { get set }
    var maximumFractionDigits: Int { get set }
}

extension NumberFormatter: NumberFormatterProtocol { }

class PreviewNumberFormatter: NumberFormatterProtocol {
    
    let numberFormatter: NumberFormatter
    
    init(locale: Locale) {
        numberFormatter = NumberFormatter()
        numberFormatter.locale = locale
    }
    
    var numberStyle: NumberFormatter.Style {
        get {
            return numberFormatter.numberStyle
        }
        set {
            numberFormatter.numberStyle = newValue
        }
    }
    
    var maximumFractionDigits: Int {
        get {
            return numberFormatter.maximumFractionDigits
        }
        set {
            numberFormatter.maximumFractionDigits = newValue
        }
    }
    
    func string(from number: NSNumber) -> String? {
        return numberFormatter.string(from: number)
    }
    
    func string(for obj: Any?) -> String? {
        numberFormatter.string(for: obj)
    }
}

struct CurrencyTextField: UIViewRepresentable {

    typealias UIViewType = CurrencyUITextField

    let numberFormatter: NumberFormatterProtocol
    let currencyField: CurrencyUITextField

    init(numberFormatter: NumberFormatterProtocol, value: Binding<Int>, maxLength: Int = 7) {
        self.numberFormatter = numberFormatter
        currencyField = CurrencyUITextField(formatter: numberFormatter, value: value, maxLength: maxLength)
    }

    func makeUIView(context: Context) -> CurrencyUITextField {
        return currencyField
    }

    func updateUIView(_ uiView: CurrencyUITextField, context: Context) { }
}
