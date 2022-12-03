//
//  LocationsViewModel.swift
//  SwiftUI-Map-App
//
//  Created by Sajid Shanta on 3/12/22.
//

import Foundation

class LocationsViewModel: ObservableObject {
    @Published var locations: [Location]
    
    init(){
        self.locations = LocationsDataService.locations
    }
}
