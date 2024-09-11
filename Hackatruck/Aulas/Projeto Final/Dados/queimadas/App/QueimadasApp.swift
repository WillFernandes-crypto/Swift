//
//  queimadasApp.swift
//  queimadas
//
//  Created by Turma01-7 on 09/09/24.
//

import SwiftUI
import SwiftData

@main
struct QueimadasApp: App {
    var body: some Scene {
        WindowGroup {
            //ContentView()
            StartTab()
        }
        .modelContainer(for: Destination.self)
    }
}
