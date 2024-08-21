//
//  ContentView.swift
//  Aula01
//
//  Created by Turma01-12 on 21/08/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(.hollowknight)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
