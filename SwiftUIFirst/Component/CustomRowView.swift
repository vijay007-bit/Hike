//
//  CustomRowView.swift
//  SwiftUIFirst
//
//  Created by Vijay Singh on 28/02/24.
//

import SwiftUI

struct CustomRowView: View {
    //MARK: - Properties
    
    @State var rowLabel: String
    @State var rowIcon: String
    @State var rowContent: String? = nil
    @State var rowTintColor: Color
    @State var rowLinkLabel: String? = nil
    @State var rowLinkDestination: String? = nil
    
    var body: some View {
        LabeledContent{
            if rowContent != nil {
                Text(rowContent!)
                    .foregroundColor(.primary)
                .fontWeight(.heavy)
            }else if (rowLinkLabel != nil) && (rowLinkDestination != nil){
                Link(rowLinkLabel!, destination: URL(string: rowLinkDestination!)!)
            } else {
                /*@START_MENU_TOKEN@*/EmptyView()/*@END_MENU_TOKEN@*/
            }
        }label: {
            HStack {
                ZStack{
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width: 30,height: 30)
                        .foregroundColor(rowTintColor)
                    Image(systemName: rowIcon)
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                }
                Text(rowLabel)
            }
        }
    }
}

#Preview {
    List{
        CustomRowView(rowLabel: "Designer", rowIcon: "paintpalette", rowContent: "John Dow", rowTintColor: .pink)
    }
}
