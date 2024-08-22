//
//  ContentView.swift
//  Aula03
//
//  Created by Turma01-12 on 22/08/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAlert = false
    @State private var name: String = "Fulano"
    var body: some View {
        ZStack {
            Image(.truck2)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
                .blur(radius: 3)
                .opacity(0.3)
            VStack (spacing: 10) {
                Text("Bem-vindo, \(name)!")
                    .foregroundStyle(.black)
                    .font(.title)
                    .frame(maxWidth: .infinity, alignment: .top)
                    .fontWeight(.bold)
                
                TextField("Insira o seu nome", text: $name)
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                VStack {
                    Image(.logo)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 230, alignment: .center)
                    Image(.truck)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 230, alignment: .center)
                }
                
                Spacer()
                
                Button("Entrar") {
                    showingAlert = true
                }
                .alert(isPresented:$showingAlert) {
                    Alert(
                        title: Text("ALERTA!"),
                        message: Text("Você irá iniciar o desafio da aula agora."),
                        dismissButton: .cancel(Text("Vamos lá!"))
                    )
                }
                
                
            }
        }
    }
}

#Preview{
    ContentView()
}
