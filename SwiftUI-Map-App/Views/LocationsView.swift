//
//  LocationsView.swift
//  SwiftUI-Map-App
//
//  Created by Sajid Shanta on 29/11/22.
//

import SwiftUI
import MapKit

struct LocationsView: View { 
    @EnvironmentObject private var vm: LocationsViewModel
    @State private var mapRegion: MKCoordinateRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 41.8986, longitude: 12.4769),
        span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $mapRegion)
                .ignoresSafeArea()
        }
//        List {
//            ForEach(vm.locations) {
//                Text($0.name)
//            }
//        }
    }
}

struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView()
            .environmentObject(LocationsViewModel())
    }
}
