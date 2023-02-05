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
    
//    @State private var mapRegion: MKCoordinateRegion = MKCoordinateRegion(
//        center: CLLocationCoordinate2D(latitude: 41.8986, longitude: 12.4769),
//        span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
    
    var body: some View {
        ZStack {
            mapLayer
                .ignoresSafeArea()
            
            VStack {
                header
                    .padding()
                
                Spacer()
                
                ZStack {
                    ForEach(vm.locations) {
                        if $0 == vm.mapLocation {
                            LocationPreviewView(location: $0)
                                .shadow(color: .black.opacity(0.3), radius: 20)
                                .padding()
                                .transition(.asymmetric(
                                    insertion: .move(edge: .trailing),
                                    removal: .move(edge: .leading)))
                        }
                    }
                }
            }
        }
    }
}

struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView()
            .environmentObject(LocationsViewModel())
    }
}

extension LocationsView {
    private var header: some View {
        VStack {
            Button(action: vm.toggleLoccationsList) {
                Text(vm.mapLocation.name + ", " + vm.mapLocation.cityName)
                    .font(.title2)
                    .foregroundColor(.primary)
                .fontWeight(.black)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .animation(.none, value: vm.mapLocation)
                .overlay(alignment: .leading) {
                    Image(systemName: "arrow.down")
                        .font(.title2)
                        .foregroundColor(.primary)
                        .rotationEffect(Angle(degrees: vm.showLocationsList ? -180 : 0))
                        .padding()
                }
            }
            if vm.showLocationsList {
                LocationsListView()
            }
        }
        .background(.thickMaterial)
        .cornerRadius(10)
        .shadow(color: .black.opacity(0.3), radius: 20, x: 0, y: 15)
    }
    
    private var mapLayer: some View {
        Map(coordinateRegion: $vm.mapRegion,
            annotationItems: vm.locations,
            annotationContent: { location in
            
            //default map pin
//                MapMarker(coordinate: location.coordinates, tint: .red)
            
            //customized map pin
            MapAnnotation(coordinate: location.coordinates) {
                MapAnnotationView(location: location)
                    .shadow(color: .black.opacity(0.3), radius: 10)
                    .scaleEffect(location == vm.mapLocation ? 1 : 0.8)
                    .onTapGesture {
                        vm.showNextLocation(location: location)
                    }
            }
        })
    }
}
