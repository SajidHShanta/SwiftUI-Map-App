//
//  MapAnnotationView.swift
//  SwiftUI-Map-App
//
//  Created by Sajid Shanta on 12/12/22.
//

import SwiftUI

struct MapAnnotationView: View {
    let accentColor = Color("AccentColor")
    
    var body: some View {
        VStack(spacing: 0.0) {
            Image(systemName: "map.circle")
                .resizable()
                .scaledToFit()
                .frame(width: 38, height: 38)
                .foregroundColor(accentColor)
            
            Image(systemName: "triangle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 10, height: 10)
                .rotationEffect(Angle(degrees: 180))
                .foregroundColor(accentColor)
                .offset(y: -2)
                .padding(.bottom, 48)  // add bottom padding to make the middle point below the pin
        }
    }
}

struct MapAnnotationView_Previews: PreviewProvider {
    static var previews: some View {
        MapAnnotationView()
    }
}
