//
//  ColorSlider.swift
//  ColorizeApp
//
//  Created by Елизавета Медведева on 29.08.2023.
//

import SwiftUI

struct ColorSlider: View {
    @Binding var value: Double
    @Binding var text: String
    
    let color: Color
    
    var body: some View {
        Slider(value: $value, in: 0...255, step: 1)
            .tint(color)
            .onChange(of: value) { newValue in
                text = newValue.formatted()
            }
    }
}

struct ColorSlider_Previews: PreviewProvider {
    static var previews: some View {
        ColorSlider(value: .constant(0.5), text: .constant("0.5"), color: .gray)
    }
}
