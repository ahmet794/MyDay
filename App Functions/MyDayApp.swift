//
//  MyDayApp.swift
//  Shared
//
//  Created by Ahmet Cihan on 15/07/2022.
//

import SwiftUI

@main
struct MyDayApp: App {
    
    @StateObject var buttonFunc = ButtonFunctions()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(buttonFunc)
        }
    }
}
