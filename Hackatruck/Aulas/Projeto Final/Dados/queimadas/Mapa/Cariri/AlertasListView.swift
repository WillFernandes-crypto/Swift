//
//  DestinosListView.swift
//  Dados
//
//  Created by Turma01-7 on 11/09/24.
//

import SwiftUI
import SwiftData

struct AlertasListView: View {
    @Query (sort: \Destination.nome) private var destinations: [Destination]
    var body: some View {
        if !destinations.isEmpty{
            Text("Hello, World!")
        } else {
            ContentUnavailableView(
                "No Destinations",
                systemImage: "globe.desk",
                description: Text("Nenhum alerta ainda. Clique em \(Image(systemName: "plus.circle.fill")) na barra de navegação para iniciar.")
            )
        }
    }
}

#Preview {
    AlertasListView()
        .modelContainer(Destination.preview)
}
