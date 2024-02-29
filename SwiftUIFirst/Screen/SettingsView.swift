//
//  SettingsView.swift
//  SwiftUIFirst
//
//  Created by Vijay Singh on 28/02/24.
//

import SwiftUI

struct SettingsView: View {
    
    private let alternateAppIcon: [String] = [
        "AppIcon-Backpack",
        "AppIcon-Camera",
        "AppIcon-Campfire",
        "AppIcon-MagnifyingGlass",
        "AppIcon-Map",
        "AppIcon-Mushroom"
    ]
    
    
    var body: some View {
        List{
            //MARK: - Section Header
            Section{
                HStack {
                    Spacer()
                    Image(systemName: "laurel.leading")
                        .font(.system(size: 80, weight: .black))
                    
                    VStack(spacing: -10) {
                        Text("Hike")
                            .font(.system(size: 66, weight: .black))
                        Text("Editors Choice")
                            .fontWeight(.medium)
                    }
                    
                    Image(systemName: "laurel.trailing")
                        .font(.system(size: 80, weight: .black))
                    Spacer()
                }
                .foregroundStyle(
                    LinearGradient(colors:
                                    [
                                        Color.customGreenLight,
                                        Color.customGreenMedium,
                                        Color.customGreenDark
                                    ],
                                   startPoint: .top,
                                   endPoint: .bottom
                                  )
                )
                .padding(.top,8)
                
                VStack(spacing: 8){
                    Text("Where can you find \nperfect tracks?")
                        .font(.title2)
                        .fontWeight(.heavy)
                    
                    Text("The hike which looks gorgeous in photos but is even better once you are actually there. The hike that you hope to do again someday. \nFind the best day hikes in the app.")
                        .font(.footnote)
                        .italic()
                    
                    Text("Dust off the boots! It's time for a walk.")
                        .fontWeight(.heavy)
                        .foregroundColor(.customGreenMedium)
                }
                .multilineTextAlignment(.center)
                .padding(.bottom, 16)
                .frame(maxWidth: .infinity)
            }
            .listRowSeparator(.hidden)
            
            //MARK: - Section Icon
            
            Section(header: Text("Alternate Icons")){
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing: 12) {
                        ForEach(alternateAppIcon.indices,id: \.self) { item in
                            Button{
                                UIApplication.shared.setAlternateIconName(alternateAppIcon[item]){error in
                                    if error != nil{
                                        print("app icon cant be changed")
                                    }
                                }
                            }label: {
                                Image("\(alternateAppIcon[item])-Preview")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80,height: 80)
                                    .cornerRadius(16)
                                    .buttonStyle(.borderless)
                        }
                        }
                    }
                }.padding(.top,12)
                Text("Choose your favourite app icon from the collection above.")
                    .frame(minWidth: 0,maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .font(.footnote)
                    .padding(.bottom,12)
            }
            .listRowSeparator(.hidden)
            
            //MARK: - Section About
            Section(
                header: Text("ABOUT THE APP"),
                footer: HStack{
                    Spacer()
                    Text("Copyright © All right reserved")
                    Spacer()
                }.padding(.vertical,8)
            ){
                //1. Basic Labeled Content
               // LabeledContent("Application", value: "Hike")
                
                //2.Advanced labeledcontent
                CustomRowView(rowLabel: "Application", rowIcon: "apps.iphone", rowContent: "HIKE", rowTintColor: .blue)
                CustomRowView(rowLabel: "Compatibility", rowIcon: "info.circle", rowContent: "iOS,iPadOS", rowTintColor: .red)
                CustomRowView(rowLabel: "Technology", rowIcon: "swift", rowContent: "SWIFT", rowTintColor: .orange)
                CustomRowView(rowLabel: "Version", rowIcon: "gear", rowContent: "1.0", rowTintColor: .purple)
                CustomRowView(rowLabel: "Developer", rowIcon: "ellipsis.curlybraces", rowContent: "John Dow", rowTintColor: .mint)
                CustomRowView(rowLabel: "Designer", rowIcon: "paintpalette", rowContent: "Vijay", rowTintColor: .pink)
                CustomRowView(rowLabel: "Website", rowIcon: "globe", rowTintColor: .indigo,rowLinkLabel: "Google", rowLinkDestination: "https://google.com")
            }
        }
    }
}

#Preview {
    SettingsView()
}
