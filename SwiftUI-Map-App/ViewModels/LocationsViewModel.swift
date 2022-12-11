//
//  LocationsViewModel.swift
//  SwiftUI-Map-App
//
//  Created by Sajid Shanta on 3/12/22.
//

import Foundation
import MapKit
import SwiftUI

class LocationsViewModel: ObservableObject {
    
    // all loaded Locations
    @Published var locations: [Location]
    
    // current location on map
    @Published var mapLocation: Location {
        didSet {
            updateMapRegion(location: mapLocation)
        }
    }
    
    // current region on map
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    //show list of location
    @Published var showLocationsList: Bool = false
    
    init(){
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        
        self.updateMapRegion(location: locations.first!)
    }
    
    private func updateMapRegion(location: Location) {
        self.mapRegion = MKCoordinateRegion(
            center: location.coordinates,
            span: mapSpan)
    }
    
    func toggleLoccationsList() {
        withAnimation {
            showLocationsList.toggle()
        }
    }
    
    func showNextLocation(location: Location) {
        withAnimation {
            mapLocation = location
            showLocationsList = false
        }
    }
}
