//
//  ColorizedApp.swift
//  ColorizeApp
//
//  Created by Елизавета Медведева on 26.08.2023.
//

import SwiftUI

struct ColorizedApp: View {
    @State private var red: Double = Double.random(in: 0...255)
    @State private var green: Double = Double.random(in: 0...255)
    @State private var blue: Double = Double.random(in: 0...255)
    
    @State private var text: String = ""
    
    @State private var alertPresented: Bool = false
    
    var body: some View {
        VStack {
            ColorView(redColor: red / 255, greenColor: green / 255, blueColor: blue / 255)
         
            HStack {
                VStack(alignment: .leading, spacing: 16) {
                    Text("\(formattedToString(from: red))")
                    Text("\(formattedToString(from: green))")
                    Text("\(formattedToString(from: blue))")
                }.padding(.trailing)
                
                VStack {
                    ColorSlider(value: $red, color: .red)
                    ColorSlider(value: $green, color: .green)
                    ColorSlider(value: $blue, color: .blue)
                }.padding(.trailing)
                
                VStack {
                    ColorTextField(value: $red, text: $text, action: formattedToString(from: red))
                    
                    ColorTextField(value: $green)
                    ColorTextField(value: $blue)
                }
                
            }.padding(.top)
            
            Spacer()
        }
        .padding()
    }
    
    private func formattedToString(from value: Double) -> String {
        String(format: "%.0f", value)
    }
  
    private func formattedToDouble(_ from: value) {
        guard let _ = String(value) else {
            value = 0
            alertPresented.toggle()
            return
        }
        text = "\(lround(value))"
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ColorizedApp()
    }
}
