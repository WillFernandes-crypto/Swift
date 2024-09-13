//
//  destinos.swift
//  queimadas
//
//  Created by Turma01-7 on 11/09/24.
//

import SwiftData
import MapKit

@Model
class Destination {
    var nome: String
    var latitude: Double?
    var longitude: Double?
    var latitudeDelta: Double?
    var longitudeDelta: Double?
    @Relationship(deleteRule: .cascade)
    var placemarks: [MTPlacemark] = []
    
    init(nome: String, latitude: Double? = nil, longitude: Double? = nil, latitudeDelta: Double? = nil, longitudeDelta: Double? = nil) {
        self.nome = nome
        self.latitude = latitude
        self.longitude = longitude
        self.latitudeDelta = latitudeDelta
        self.longitudeDelta = longitudeDelta
    }
    
    var region: MKCoordinateRegion? {
        if let latitude, let longitude, let latitudeDelta, let longitudeDelta{
            return MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: latitude, longitude: longitude), // Coordenadas do Cariri
                span: MKCoordinateSpan(latitudeDelta: latitudeDelta, longitudeDelta: longitudeDelta) // Controle do zoom
            )
        } else {
            return nil
        }
    }
}

extension Destination {
    @MainActor
    static var preview: ModelContainer {
        let container = try! ModelContainer(
            for: Destination.self,
            configurations: ModelConfiguration(
                isStoredInMemoryOnly: true
            )
        )

        let cariri = Destination(
            nome: "Região do Cariri",
            latitude: -7.229,
            longitude: -39.312,
            latitudeDelta: 0.20,
            longitudeDelta: 0.20
            )
        container.mainContext.insert(cariri)
        var placeMarks: [MTPlacemark]{
            [
            MTPlacemark(name: "Juazeiro do Norte", latitude: -7.203077, longitude: -39.317723),
            MTPlacemark(name: "Crato", latitude: -7.236718, longitude: -39.414853),
            MTPlacemark(name: "Barbalha", latitude: -7.311473, longitude: -39.301824),
            MTPlacemark(name: "Missão Velha", latitude: 48.880071, longitude: 2.354977),
            MTPlacemark(name: "Jardim", latitude: -7.244570, longitude: -39.141990),
            MTPlacemark(name: "Nova Olinda", latitude: -7.089878, longitude: -39.683484),
            MTPlacemark(name: "Farias Brito", latitude: -6.926830, longitude: -39.572727),
            MTPlacemark(name: "Caririaçu", latitude: -7.041260, longitude: -39.283336),
            MTPlacemark(name: "Santana do Cariri", latitude: -7.185626, longitude: -39.737358)
            ]
        }
        placeMarks.forEach {placemark in
            cariri.placemarks.append(placemark)}
        return container
    }
}
