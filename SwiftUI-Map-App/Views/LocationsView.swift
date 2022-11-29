//
//  LocationsView.swift
//  SwiftUI-Map-App
//
//  Created by Sajid Shanta on 29/11/22.
//

import SwiftUI

class LocationsViewModel: ObservableObject {
    @Published var locations: [Location]
    
    init(){
        self.locations = LocationsDataService.locations
    }
}

struct LocationsView: View {
    @StateObject private var em = LocationsViewModel()
    
    var body: some View {
        List {
            ForEach(em.locations) {
                Text($0.name)
            }
        }
    }
}

struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView()
    }
}
