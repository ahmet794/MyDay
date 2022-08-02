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
                Color
                    .white
                    .toolbar {
                ToolbarItem(placement: .navigationBarTrailing){
                Menu{
                    Button("Add Task") {
                        withAnimation {
                            buttonFunc.present()
                    }
            }
                                    
                } label: {
                    Label(
                        title: { Text("Add")},
                        icon: { Image(systemName: "plus")}
                        )
                    }
                }
            }
            .padding(0.0)
            .navigationTitle("MyDay")
            }
            .overlay(alignment: .center) {
                if buttonFunc.action.isPresented{
                    AddTaskView {
                        buttonFunc.dismiss()
                    }
                }
            }
            
        }
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .strokeBorder(.red, lineWidth: 10)
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ButtonFunctions())
            
    }
}
