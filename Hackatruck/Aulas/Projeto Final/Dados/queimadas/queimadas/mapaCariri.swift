//
//  mapaCariri.swift
//  queimadas
//
//  Created by Turma01-7 on 10/09/24.
//

import SwiftUI
import MapKit

struct mapaCariri: View {
    @State private var cameraPosition: MapCameraPosition = .automatic
    var body: some View {
        Map(position: $cameraPosition){
            Marker("Juazeiro do Norte",
                   coordinate: CLLocationCoordinate2D(
                   latitude: -7.203077,
                   longitude: -39.317723))
        
        }
        // -7.238809, -39.418230
            .onAppear(){
                let cariri = CLLocationCoordinate2D(latitude: -7.238809, longitude: -39.418230)
                let caririSpan = MKCoordinateSpan(latitudeDelta: 0.15, longitudeDelta: 0.15)
                let caririRegion = MKCoordinateRegion(center: cariri, span: caririSpan)
                cameraPosition = .region(caririRegion)
            }
    }
}

#Preview {
    mapaCariri()
}
