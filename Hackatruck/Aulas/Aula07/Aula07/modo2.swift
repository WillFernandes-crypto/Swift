//
//  modo2.swift
//  Aula07
//
//  Created by Turma01-12 on 28/08/24.
//

import SwiftUI

struct modo2: View {
    @State var isPresenting = false
    
    var body: some View {
        
        NavigationStack{
            
            ZStack{
                Color(.bg)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    
                    
                    VStack {
                        Text("Modo 2")
                            .foregroundColor(.white)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 156, height: 80)
                            .font(.title)
                            .bold()
                    }
                    
                    Spacer()
                    
                    Rectangle()
                            .frame(width: 300, height: 200)
                            .foregroundColor(.colorButton)
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                            .overlay(
                                Text("Hello World")
                            )
                    
                    NavigationStack {
                        Text("Thiago\nSobrenome: Pereira")
                            .frame(width: 300, height: 200)
                            .multilineTextAlignment(.center)
                            .padding(10)
                            .foregroundColor(.white)
                            .background(.colorButton)
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                        
                        Button("Acessar a tela") {
                            isPresenting = true
                        }
                        .navigationDestination(
                            isPresented: $isPresenting){
                                modo2_2()
                            }
                            .frame(width: 120, height: 25)
                            .padding(10)
                            .foregroundColor(.white)
                            .background(.blue)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                    }
                    Spacer()
                }
            }
        }
        
    }
}

#Preview {
    modo2()
}
