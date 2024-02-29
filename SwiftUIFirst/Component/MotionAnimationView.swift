//
//  MotionAnimationView.swift
//  SwiftUIFirst
//
//  Created by Vijay Singh on 28/02/24.
//

import SwiftUI

struct MotionAnimationView: View {
    
    //MARK: - Properties
    
    @State private var randomCircle: Int = Int.random(in: 6...12)
    @State private var isAnimating: Bool = false
    
    //MARK: - Functions
    //MARK:- Step 1:- Random Coordinate
    func randomCoordinate() -> CGFloat{
        return CGFloat.random(in: 0...256)
    }
    
    //MARK:- Step 2:- Random Size
    func randomSize() -> CGFloat{
        return CGFloat(Int.random(in: 4...80))
    }
    
    //MARK:- Step 3:- Random Scale
    
    func randomScale() -> CGFloat{
        return CGFloat(Double.random(in: 0.1...2.0))
    }
    
    
    //MARK:- Step 4:- Random Speed
    
    func randomSpeed() -> Double{
        return Double.random(in: 0.05...1.0)
    }
    //MARK:- Step 5:- Random Delay
    
    func randomDelay() -> Double{
        return Double.random(in: 0.0...2.0)
    }
    
    
    var body: some View {
        ZStack{
            ForEach(0...randomCircle, id: \.self) { item in
                Circle()
                    .foregroundColor(.white)
                    .opacity(0.25)
                    .position(x: randomCoordinate(), y: randomCoordinate())
                    .frame(width: randomSize())
                    .scaleEffect(isAnimating ? randomScale() : 1)
                    .onAppear(perform: {
                        withAnimation (
                            .interpolatingSpring(stiffness: 0.25, damping: 0.25)
                            .repeatForever()
                            .speed(randomSpeed())
                            .delay(randomDelay())
                        ){
                            isAnimating = true
                        }
                    })
            }
        }
        .frame(width: 256,height: 256)
        .mask(Circle())
        .drawingGroup()
    }
}

#Preview {
    MotionAnimationView()
        .background(Circle().fill(.teal))
}
