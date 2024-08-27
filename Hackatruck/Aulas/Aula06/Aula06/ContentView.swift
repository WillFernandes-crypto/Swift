//
//  ContentView.swift
//  Aula06
//
//  Created by Turma01-12 on 27/08/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationStack {
            ZStack{
                paintbrush()
                    .frame(width: .infinity, height: 700, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .padding()
            }
            Spacer()
            VStack{
                NavigationLink(destination: tela01()){
                    Image("paintbrush")
                    Text("Mostrar")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
