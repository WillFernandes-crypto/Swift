//
//  MapView.swift
//  MonitorDeQueimadas
//
//  Created by Turma01-11 on 06/09/24.
//

//
//  Mapa.swift
//  Dados
//
//  Created by Turma01-7 on 12/09/24.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    @State var region = MapCameraPosition.region(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: -7.203077, longitude:  -39.317723), span: MKCoordinateSpan(latitudeDelta: 1.2, longitudeDelta: 1.2)))
    
    struct Local: Codable, Hashable {
        let local: String
        let latitude: Double
        let longitude: Double
    }

    let locais: [Local] = [
        Local(local: "juazeiroDoNorte", latitude: -7.203077, longitude: -39.317723),
        Local(local: "crato", latitude: -7.236718, longitude: -39.414853),
        Local(local: "barbalha", latitude: -7.311473, longitude: -39.301824),
        Local(local: "missaoVelha", latitude: 48.880071, longitude: 2.354977),
        Local(local: "jardim", latitude: -7.244570, longitude: -39.141990),
        Local(local: "novaOlinda", latitude: -7.089878, longitude: -39.683484),
        Local(local: "fariasBrito", latitude: -6.926830, longitude: -39.572727),
        Local(local: "caririacu", latitude: -7.041260, longitude: -39.283336),
        Local(local: "santanaDoCariri", latitude: -7.185626, longitude: -39.737358)
    ]
    
    var body: some View {
        VStack{
            Map(position: $region){
                ForEach(locais, id:\.self){ l in
                    Annotation(l.local, coordinate: CLLocationCoordinate2D(latitude: l.latitude, longitude: l.longitude), content: {
                        
                        Image(systemName: "flame.circle.fill")
                            .foregroundColor(.red)
                            .font(.system(size: 25))
                        
                    })
                }
            }
        }
    }
}

#Preview {
    MapView()
}
