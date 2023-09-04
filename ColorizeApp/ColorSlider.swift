//
//  ColorSlider.swift
//  ColorizeApp
//
//  Created by Елизавета Медведева on 29.08.2023.
//

import SwiftUI

struct ColorSlider: View {

    @Binding var value: Double
    @State private var text = ""
    @State private var alert = false
    
    let color: Color
    
    var body: some View {
        HStack{
            Text(value.formatted())
                .frame(width: 30, alignment: .leading)
            
            Slider(value: $value, in: 0...255, step: 1)
                .tint(color)
                .onChange(of: value) { newValue in
                    text = newValue.formatted()
                }
            ColorTextField(text: $text, value: $value, action: checkValue)
                .alert("Wrong Format", isPresented: $alert, actions: {}) {
                    Text("Format 0...255")
                }
        }
        .onAppear{
            text = value.formatted()
        }
    }
    
    private func checkValue() {
        if let value = Int(text), (0...255).contains(value) {
            self.value = Double(text)
            return
        }
        alert.toggle()
        value = 0
        text = "0"
    }
}

struct ColorSlider_Previews: PreviewProvider {
    static var previews: some View {
        ColorSlider(value: 50, color: .red)
    }
}
