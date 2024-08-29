//
//  modo1.swift
//  Aula07
//
//  Created by Turma01-12 on 28/08/24.
//

import SwiftUI

struct modo1: View {
    var body: some View {
        
        NavigationStack{
            
            ZStack{
                Color(.bg)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    
                    
                    VStack {
                        Text("Modo 1")
                            .foregroundColor(.white)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 156, height: 80)
                            .font(.title)
                            .bold()
                    }
                    
                    Spacer()
                    
                        Text("Nome: Thiago\nSobrenome: Pereira")
                            .frame(width: 190, height: 90)
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

#Preview {
    modo1()
}
