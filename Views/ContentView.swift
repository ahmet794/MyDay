//
//  ContentView.swift
//  Shared
//
//  Created by Ahmet Cihan on 15/07/2022.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var buttonFunc: ButtonFunctions
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.red, .white]), startPoint: .bottomLeading, endPoint: .topTrailing)
                    .ignoresSafeArea()
                // Background Colour
                VStack (spacing: 0) {
                    NavigationBarView()
                        .padding(.horizontal, 15)
                        .padding(.bottom)
                        .padding(.top, 45)
                        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 5)
                    
                    Spacer()
                }
                .ignoresSafeArea()
                // Navigation Bar
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ButtonFunctions())
            
    }
}
