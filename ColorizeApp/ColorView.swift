//
//  ColorView.swift
//  ColorizeApp
//
//  Created by Елизавета Медведева on 29.08.2023.
//

import SwiftUI

struct ColorView: View {
    let redColor: Double
    let greenColor: Double
    let blueColor: Double
    
    var body: some View {
        Color(red: redColor, green: greenColor, blue: blueColor)
            .frame(height: 200)
            .cornerRadius(15)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(lineWidth: 1))
            
            .shadow(color: .gray.opacity(0.6), radius: 3)
    }
}

struct ColorView_Previews: PreviewProvider {
    static var previews: some View {
        ColorView(redColor: 0.5, greenColor: 0.5, blueColor: 0.5)
    }
}
