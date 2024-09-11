//
//  StartTab.swift
//  queimadas
//
//  Created by Turma01-7 on 11/09/24.
//

import SwiftUI

struct StartTab: View {
    var body: some View {
        TabView{
            Group {
                MapaCaririView()
                    .tabItem {
                        Label("Mapa Cariri", systemImage: "map")
                    }
                AlertasListView()
                    .tabItem {
                        Label("Alertas", systemImage: "exclamationmark.triangle.fill")
                    }
            }
            .toolbarBackground(.orange.opacity(0.8), for: .tabBar)
            .toolbarBackground(.visible, for: .tabBar)
            .toolbarColorScheme(.dark, for: .tabBar)
        }
    }
}

#Preview {
    StartTab()
}
