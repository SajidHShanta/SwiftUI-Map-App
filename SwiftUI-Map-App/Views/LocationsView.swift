//
//  LocationsView.swift
//  SwiftUI-Map-App
//
//  Created by Sajid Shanta on 29/11/22.
//

import SwiftUI

struct LocationsView: View { 
    @EnvironmentObject private var vm: LocationsViewModel
    
    var body: some View {
        List {
            ForEach(vm.locations) {
                Text($0.name)
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
