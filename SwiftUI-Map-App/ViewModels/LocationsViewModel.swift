//
//  LocationsViewModel.swift
//  SwiftUI-Map-App
//
//  Created by Sajid Shanta on 3/12/22.
//

import Foundation
import MapKit

class LocationsViewModel: ObservableObject {
    @Published var locations: [Location]
    
    @Published var mapLocation: Location {
        didSet {
            updateMapRegion(location: mapLocation)
        }
    }
    
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    init(){
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        
        self.updateMapRegion(location: locations.first!)
    }
    
    func updateMapRegion(location: Location) {
        self.mapRegion = MKCoordinateRegion(
            center: location.coordinates,
            span: mapSpan)
    }
}
