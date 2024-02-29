//
//  CustomButtonView.swift
//  SwiftUIFirst
//
//  Created by Vijay Singh on 28/02/24.
//

import SwiftUI

struct CustomButtonView: View {
    var body: some View {
        ZStack{
            Circle()
                .fill(
                    LinearGradient(colors: [.white,.customGreenLight,.customGreenMedium], startPoint: .top, endPoint: .bottom)
                )
            Circle()
                .stroke(LinearGradient(colors: [.white,.customGrayLight,.customGrayMedium], startPoint: .top, endPoint: .bottom),lineWidth: 4)
            
            Image(systemName: "figure.hiking")
                .fontWeight(.black)
                .font(.system(size: 30))
                .foregroundStyle(
                    LinearGradient(colors: [.white,.customGrayLight,.customGrayMedium], startPoint: .top, endPoint: .bottom)
                )
        }.frame(width: 58,height: 58)
    }
}

#Preview {
    CustomButtonView().previewLayout(.sizeThatFits).padding()
}
