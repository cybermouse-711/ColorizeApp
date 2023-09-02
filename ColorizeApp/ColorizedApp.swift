//
//  ColorizedApp.swift
//  ColorizeApp
//
//  Created by Елизавета Медведева on 26.08.2023.
//

import SwiftUI

enum ColorApp {
    case red, green, blue
}

struct ColorizedApp: View {
    @State private var red: Double = Double.random(in: 0...255)
    @State private var green: Double = Double.random(in: 0...255)
    @State private var blue: Double = Double.random(in: 0...255)
    
    @State private var redText: String = ""
    @State private var greenText: String = ""
    @State private var blueText: String = ""
    
    @State private var alertPresented: Bool = false
    
    var body: some View {
        VStack {
            ColorView(redColor: red / 255, greenColor: green / 255, blueColor: blue / 255)
         
            HStack {
                VStack(alignment: .leading, spacing: 16) {
                    Text("\(formattedToText(from: red))")
                    Text("\(formattedToText(from: green))")
                    Text("\(formattedToText(from: blue))")
                }.padding(.trailing)
                
                VStack {
                    ColorSlider(value: $red, text: $redText, color: .red)
                    ColorSlider(value: $green, text: $greenText, color: .green)
                    ColorSlider(value: $blue, text: $blueText, color: .blue)
                }.padding(.trailing)
                
                VStack {
                    ColorTextField(value: $red, text: $redText, action: { text in
                        formattedToTextField(from: text, and: .red)
                    })
                        .alert("Incorrect format", isPresented: $alertPresented, actions: {}) {
                            Text("Format it should be 0...255")
                        }
                    ColorTextField(value: $green, text: $greenText, action: { text in
                        formattedToTextField(from: text, and: .green)
                    })
                        .alert("Incorrect format", isPresented: $alertPresented, actions: {}) {
                            Text("Format it should be 0...255")
                        }
                    ColorTextField(value: $blue, text: $blueText, action: { text in
                        formattedToTextField(from: text, and: .blue)
                    })
                        .alert("Incorrect format", isPresented: $alertPresented, actions: {}) {
                            Text("Format it should be 0...255")
                        }
                }
            }.padding(.top)
            
            Spacer()
        }
        .padding()
    }
    
    private func formattedToText(from value: Double) -> String {
        String(format: "%.0f", value)
    }
    
    private func formattedToTextField(from text: String, and state: ColorApp) {
        guard let value = Double(text), (0...255).contains(value) else {
            alertPresented.toggle()
            return
        }

        switch state {
        case .red:
            red = value
            redText = text
        case .green:
            green = value
            greenText = text
        case .blue:
            blue = value
            blueText = text
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ColorizedApp()
    }
}
