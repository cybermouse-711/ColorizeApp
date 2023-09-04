//
//  ColorizedApp.swift
//  ColorizeApp
//
//  Created by Елизавета Медведева on 26.08.2023.
//

import SwiftUI

struct ColorizedApp: View {
    
    @State private var red = Double.random(in: 0...255).rounded()
    @State private var green = Double.random(in: 0...255).rounded()
    @State private var blue = Double.random(in: 0...255).rounded()
    
    @FocusState private var focusedField: Field?
    
    var body: some View {
        ZStack {
            Color("Background")
                .ignoresSafeArea()
                .onTapGesture {
                    focusedField = nil
                }
            VStack(spacing: 30) {
                ColorView(red: red, green: green, blue: blue)
                
                VStack(spacing: 30) {
                    ColorSlider(value: $red, color: .red)
                        .focused($focusedField, equals: .red)
                    ColorSlider(value: $green, color: .green)
                        .focused($focusedField, equals: .green)
                    ColorSlider(value: $blue, color: .blue)
                        .focused($focusedField, equals: .blue)
                }
                .frame(height: 150)
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Button(action: nextField) {
                            Image(systemName: "chevron.up")
                        }
                        Button(action: backField) {
                            Image(systemName: "chevron.down")
                        }
                        Spacer()
                        Button("Done") {
                            focusedField = nil
                        }
                    }
                }
                Spacer()
            }
            .padding()
        }
    }
}

extension ColorizedApp {
    
    private enum Field {
        case red, green, blue
    }
    
    private func nextField() {
        switch focusedField {
        case .red:
            focusedField = .green
        case .green:
            focusedField = .blue
        case .blue:
            focusedField = .red
        case .none:
            focusedField = nil
        }
    }
    
    private func backField(){
        switch focusedField {
        case .red:
            focusedField = .blue
        case .green:
            focusedField = .red
        case .blue:
            focusedField = .green
        case .none:
            focusedField = nil
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ColorizedApp()
    }
}
