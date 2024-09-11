//
//  MTPlacemark.swift
//  queimadas
//
//  Created by Turma01-7 on 11/09/24.
//

import SwiftData
import MapKit

@Model
class MTPlacemark {
    var nome: String
    var latitude: Double
    var longitude: Double
    var destino: Destination?
    
    init(nome: String, latitude: Double, longitude: Double) {
        self.nome = nome
        self.latitude = latitude
        self.longitude = longitude
    }
    var coordinate: CLLocationCoordinate2D {
        .init(latitude: latitude, longitude: longitude)
    }
}
