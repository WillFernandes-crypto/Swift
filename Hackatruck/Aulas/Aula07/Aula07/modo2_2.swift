//
//  modo2_2.swift
//  Aula07
//
//  Created by Turma01-12 on 28/08/24.
//

import SwiftUI

struct modo2_2: View {
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
                        VStack{
                            Text("Volte, Tiago!!")
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                .bold()
                        }
                    }
                    .frame(width: 150, height: 90)
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
    modo2_2()
}
