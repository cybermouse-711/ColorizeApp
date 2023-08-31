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
    
    @State private var alertPresented: Bool = false
    
    var body: some View {
        VStack {
            ColorView(redColor: red/255, greenColor: green/255, blueColor: blue/255) //захардкодила
            
            HStack {
                VStack(alignment: .leading, spacing: 16) { //захардкодила
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
                    ColorTextField(value: formattedToString(from: $red))
                    ColorTextField(value: formattedToString(from: $green))
                    ColorTextField(value: formattedToString(from: $blue))
                }
                
            }.padding(.top)
            
            Spacer()
        }
        .padding()
    }
    
    private func formattedToString(from value: Double) -> String {
        String(format: "%.0f", value)
    }
   /*
    private func checkTextField() {
        if let _ = 1...255 {
            alertPresented.toggle()
        }
    } */
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ColorizedApp()
    }
}
