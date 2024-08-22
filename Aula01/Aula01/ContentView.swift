//
//  ContentView.swift
//  Aula01
//
//  Created by Turma01-12 on 22/08/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            Image(.hollowknight)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 120)
                .offset(x: -2.0)
            VStack(spacing: 10) {
                Text("Deep dive into a dark place")
                    .foregroundStyle(.black)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Art worthy of being in a museum")
                    .foregroundStyle(.gray)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("The joy of discovery")
                    .foregroundStyle(.blue)
                    .frame(maxWidth: .infinity, alignment: .leading)

            }.fixedSize()
        }
    }
}

#Preview {
    ContentView()
}
