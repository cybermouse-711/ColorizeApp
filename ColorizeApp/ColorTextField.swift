//
//  ColorTextField.swift
//  ColorizeApp
//
//  Created by Елизавета Медведева on 29.08.2023.
//

import SwiftUI

struct ColorTextField: View {
    @Binding var value: Double
    @Binding var text: String
    
    let action: (String) -> Void
    
    var body: some View {
        TextField("0", text: $text) { _ in
            withAnimation {
                action(text)
            }
        }
            .bordered()
    }
}

struct ColorTextField_Previews: PreviewProvider {
    static var previews: some View {
        ColorTextField(value: .constant(0.5), text: .constant("0.5"), action: {_ in })
        
    }
}

struct BorderedViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 40, height: 30)
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(lineWidth: 1)
                    .foregroundColor(.gray.opacity(0.9))
            )
            .shadow(color: .gray.opacity(0.6), radius: 3)
    }
}

extension TextField {
    func bordered() -> some View {
        modifier(BorderedViewModifier())
    }
}
