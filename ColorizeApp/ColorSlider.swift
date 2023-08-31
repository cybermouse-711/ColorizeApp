//
//  ColorSlider.swift
//  ColorizeApp
//
//  Created by Елизавета Медведева on 29.08.2023.
//

import SwiftUI

struct ColorSlider: View {
    @Binding var value: Double 
    let color: Color
    
    var body: some View {
        Slider(value: $value, in: 0...255, step: 1)
            .tint(color)
    }
}

struct ColorSlider_Previews: PreviewProvider {
    static var previews: some View {
        ColorSlider(value: 0.5, color: .gray)
    }
}
