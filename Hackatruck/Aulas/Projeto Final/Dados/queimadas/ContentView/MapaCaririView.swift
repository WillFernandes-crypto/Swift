//
//  mapaCariri.swift
//  queimadas
//
//  Created by Turma01-7 on 10/09/24.
//

import SwiftUI
import MapKit
import SwiftData

struct MapaCaririView: View {
    @State private var cameraPosition: MapCameraPosition = .automatic
    @State private var visibleRegion: MKCoordinateRegion?
    @Query private var destinations: [Destination]
    @State private var destination: Destination?
    var body: some View {
        Map(position: $cameraPosition){
            if let destination{
                ForEach(destination.placemarks){ placemark in
                    Marker(coordinate: placemark.coordinate){
                        Label(placemark.nome, systemImage: "star.fill")
                    }
                    .tint(.green)
                }
            }
        }
        .onMapCameraChange(frequency: .onEnd) {
            context in visibleRegion = context.region
        }
        
        // -7.238809, -39.418230
        .onAppear(){
            destination = destinations.first
            if let region = destination?.region{
                cameraPosition = .region(region)
            }
        }
    }
}

#Preview {
    MapaCaririView()
        .modelContainer(Destination.preview)
}
