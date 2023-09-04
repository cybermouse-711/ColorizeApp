//
//  ColorTextField.swift
//  ColorizeApp
//
//  Created by Елизавета Медведева on 29.08.2023.
//

import SwiftUI

struct ColorTextField: View {
    
    @Binding var text: String
    @Binding var value: Double
    
    let action: () -> Void
    
    var body: some View {
        TextField("0", text: $text) { _ in
            withAnimation {
                action()
            }
        }
        .frame(width: 50, alignment: .trailing)
        .multilineTextAlignment(.trailing)
        .textFieldStyle(.roundedBorder)
        .keyboardType(.decimalPad)
    }
}

struct ColorTextField_Previews: PreviewProvider {
    static var previews: some View {
        ColorTextField(text: .constant("0"), value: .constant(0), action: {})
    }
}


