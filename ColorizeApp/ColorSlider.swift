//
//  ColorSlider.swift
//  ColorizeApp
//
//  Created by Елизавета Медведева on 29.08.2023.
//

import SwiftUI

struct ColorSlider: View {
    @State var value: Double //исправить на байнд
    var color: Color
    
    var body: some View {
        Slider(value: $value, in: 0...255, step: 1)
            .foregroundColor(color)
    }
}

struct ColorSlider_Previews: PreviewProvider {
    static var previews: some View {
        ColorSlider(value: Double.random(in: 0...255), color: .gray)
    }
}
