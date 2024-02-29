//
//  ContentView.swift
//  SwiftUIFirst
//
//  Created by Vijay Singh on 07/02/24.
//

import SwiftUI

extension Image{
    func imageModifier() -> some View{
        self
            .resizable()
            .scaledToFit()
    }
    
    func placeholderModifier() -> some View{
        self
            .imageModifier()
            .frame(maxWidth: 128)
            .foregroundColor(.purple)
            .opacity(0.5)
    }
}


struct ContentView: View {
    var body: some View {
        CardView()
    }
}

#Preview {
    ContentView()
}
