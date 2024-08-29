//
//  ContentView.swift
//  Aula07
//
//  Created by Turma01-12 on 28/08/24.
//

import SwiftUI

struct ContentView: View {
    @State var isPresenting = false
    
    var body: some View {
        
        NavigationStack{
            
            ZStack{
                Color(.bg)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    
                    
                    VStack {
                        Image(.logo)
                            .resizable()
                            .foregroundColor(.white)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 156, height: 80)
                    }
                    
                    Spacer()
                    
                    NavigationLink(destination: modo1()) {
                        Text("Modo 1")
                            .frame(width: 150, height: 60)
                            .padding(10)
                            .foregroundColor(.white)
                            .background(.colorButton)
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                    }
                    
                    NavigationLink(destination: modo2()) {
                        Text("Modo 2")
                            .frame(width: 150, height: 60)
                            .padding(10)
                            .foregroundColor(.white)
                            .background(.colorButton)
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                    }
                    
                    Button("Modo 3") {
                        isPresenting.toggle()
                    }
                    .sheet(isPresented: $isPresenting) {
                        modo3()
                    }
                    .frame(width: 150, height: 60)
                    .padding(10)
                    .foregroundColor(.white)
                    .background(.colorButton)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                    Spacer()
                }
            }
        }
    }
}


#Preview {
    ContentView()
}
