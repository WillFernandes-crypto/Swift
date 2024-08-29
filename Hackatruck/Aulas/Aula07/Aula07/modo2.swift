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
                    
                    NavigationStack {
                        
                        Spacer()
                        
                        VStack{
                            
                            Spacer()
                            
                            Text("Tiago")
                                .padding(2)
                            Text("Bem-vindo, Tiago")
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                .bold()
                            
                            Spacer()
                            
                            NavigationLink(destination: modo2_2()){
                                Text("Acessar Tela")
                                    .padding(2)
                                    .frame(width: 120, height: 25)
                                    .padding(10)
                                    .foregroundColor(.white)
                                    .background(.blue)
                                    .clipShape(RoundedRectangle(cornerRadius: 15))
                                    .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                            }
                        }
                        .frame(width: 300, height: 200)
                        .multilineTextAlignment(.center)
                        .padding(10)
                        .foregroundColor(.white)
                        .background(.colorButton)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        
                        Spacer()
                        
                    }
                }
            }
            
        }
    }
}

#Preview {
    modo2()
}
