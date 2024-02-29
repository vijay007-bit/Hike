//
//  GradientButtonStyle.swift
//  SwiftUIFirst
//
//  Created by Vijay Singh on 28/02/24.
//

import Foundation
import SwiftUI


struct GradientButton: ButtonStyle{
    
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .padding(.vertical)
            .padding(.horizontal, 30)
            .background(
                //COnditional STatement to nil coalescing
                // Condition ? A : B
                // A: WHen user press the button
                //B: When button is not pressed
                
                configuration.isPressed 
                ?
                LinearGradient(colors: [Color.customGrayMedium, Color.customGrayLight],
                startPoint: .top,
                endPoint:.bottom
                )
                :
                LinearGradient(colors: [Color.customGrayLight, Color.customGrayMedium],
                startPoint: .top,
                endPoint:.bottom
                )
            )
            .cornerRadius(40)
    }
    
    
    
}
