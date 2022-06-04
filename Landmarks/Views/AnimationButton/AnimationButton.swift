//
//  AnimationButton.swift
//  Landmarks
//
//  Created by yang on 2022/6/4.
//

import SwiftUI



struct AnimationButton: View {
    @State private var rotation: Double = 0
    
    var body: some View {
        Button{
            withAnimation(.spring( dampingFraction: 0.3)){
                rotation += 60.0
            }
        }label: {
            Text("Click To Animate")
                .rotationEffect(.degrees(rotation))
        }
        
    }
}

struct AnimationButton_Previews: PreviewProvider {
    static var previews: some View {
        AnimationButton()
    }
}
