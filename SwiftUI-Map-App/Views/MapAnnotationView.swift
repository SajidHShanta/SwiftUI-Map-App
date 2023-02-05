//
//  MapAnnotationView.swift
//  SwiftUI-Map-App
//
//  Created by Sajid Shanta on 12/12/22.
//

import SwiftUI

struct MapAnnotationView: View {
    let location: Location
    let accentColor = Color("AccentColor")
    
    var body: some View {
        VStack(spacing: 0.0) {
            if let imageName = location.imageNames.first {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 38, height: 38)
                    .clipShape(Circle())
                    .background {
                        RoundedRectangle(cornerRadius: 38)
                            .stroke(accentColor, lineWidth: 10)
                    }
                    .zIndex(2)
            } else {
                Image(systemName: "map.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48)
                    .foregroundColor(accentColor)
                    .zIndex(2)
            }
            
            Image(systemName: "triangle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 15, height: 15)
                .rotationEffect(Angle(degrees: 180))
                .foregroundColor(accentColor)
                .offset(y: -2)
                .padding(.bottom, 48)  // add bottom padding to make the middle point below the pin
                .zIndex(1)
        }
    }
}

struct MapAnnotationView_Previews: PreviewProvider {
    static var previews: some View {
        MapAnnotationView(location: LocationsDataService.locations.first!)
    }
}
