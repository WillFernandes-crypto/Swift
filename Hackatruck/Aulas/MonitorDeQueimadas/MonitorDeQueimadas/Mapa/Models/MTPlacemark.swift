//
//  MTPlacemark.swift
//  queimadas
//
//  Created by Turma01-7 on 11/09/24.
//

import SwiftData
import MapKit

@Model
class MTPlacemark: Identifiable {
    var id = UUID()  // Adiciona um identificador único
    var nome: String
    var latitude: Double
    var longitude: Double
    var destination: Destination?
    
    init(name: String, latitude: Double, longitude: Double) {
        self.nome = name
        self.latitude = latitude
        self.longitude = longitude
    }
    
    var coordinate: CLLocationCoordinate2D {
        .init(latitude: latitude, longitude: longitude)
    }
}

