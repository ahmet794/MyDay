//
//  NavigationBarView.swift
//  MyDay
//
//  Created by Ahmet Cihan on 02/08/2022.
//

import SwiftUI

struct NavigationBarView: View {
    var body: some View {
        HStack {
            Button(action: {},
                   label: {Image(systemName: "magnifyingglass")
                    .font(.title)
                    .foregroundColor(.black)
            }) // Button
            
            Spacer()
            
            Text("MyDay")
                .font(.title)
                .italic()
                .fontWeight(.heavy)
                .foregroundColor(.black)
            
            
            Spacer()
            
            Button(action: {},
                   label: {Image(systemName: "plus")
                    .font(.title)
                    .foregroundColor(.black)
            }) // Button
        }
        
    }
}

struct NavigationBarView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
