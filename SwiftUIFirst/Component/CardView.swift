//
//  CardView.swift
//  SwiftUIFirst
//
//  Created by Vijay Singh on 28/02/24.
//

import SwiftUI

struct CardView: View {
    //MARK: - Propertise
    
    @State private var imageNumber: Int = 1
    @State private var randomNumber: Int = 1
    @State private var isShowingSheet: Bool = false
    
    //MARK: - Functions
    
    func randomImage(){
        repeat{
            randomNumber = Int.random(in: 1...5)
        }while randomNumber == imageNumber
       
        imageNumber = randomNumber
    }
    
    
    var body: some View {
            ZStack {
                CustomBackgroundView()
                VStack {
                    //MARK: - Header
                    VStack(alignment: .leading){
                        HStack {
                            Text("Hiking")
                                .fontWeight(.black)
                                .font(.system(size: 52))
                                .foregroundStyle(
                                    LinearGradient(colors: [Color.customGrayLight, Color.customGrayMedium], startPoint: .top, endPoint: .bottom)
                            )
                            Spacer()
                            Button{
                                isShowingSheet.toggle()
                            }label: {
                               CustomButtonView()
                            }
                            .sheet(isPresented: $isShowingSheet){
                                SettingsView()
                                    .presentationDragIndicator(.visible)
                                    .presentationDetents([.medium,.large])
                            }
                        }
                        
                        Text("Fun and enjoyable outdoor activity for friends and families")
                            .multilineTextAlignment(.leading)
                            .italic()
                            .foregroundColor(.customGrayMedium)
                    }.padding(.horizontal, 30)
                    //MARK: - Main Content
                ZStack {
                    CustomCircleView()
                    Image("image-\(imageNumber)")
                        .resizable()
                        .scaledToFit()
                        .animation(.default, value: imageNumber)
                }
                    
                //MARK: - Footer
                    
                    Button{
                        randomImage()
                    }label: {
                        Text("Explore More")
                            .font(.title2)
                            .fontWeight(.heavy)
                            .foregroundStyle(
                                LinearGradient(colors: [Color.customGreenLight, Color.customGreenMedium],
                                startPoint: .top,
                                endPoint:.bottom
                                )
                            )
                            .shadow(color: .black.opacity(0.25), radius: 0.25,x: 1,y: 2)
                    }
                    .buttonStyle(GradientButton())
                    
            }
        }.frame(width: 320,height: 570)
    }
}

#Preview {
    CardView()
}
