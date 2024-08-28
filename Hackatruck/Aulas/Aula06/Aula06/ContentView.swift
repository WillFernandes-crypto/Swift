//
//  ContentView.swift
//  Aula06
//
//  Created by Turma01-12 on 27/08/24.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        TabView {
            tela01()
                .tabItem {
                    Label("Rosa", systemImage: "paintbrush")
                }
            tela02()
                .tabItem {
                    Label("Azul", systemImage: "paintbrush.pointed")
                }
            tela03()
                .tabItem {
                    Label("Cinza", systemImage: "paintpalette.fill")
                }
            lista()
                .tabItem {
                    Label("Lista", systemImage: "list.bullet")
                }
        }
    }
}

#Preview {
    ContentView()
}
