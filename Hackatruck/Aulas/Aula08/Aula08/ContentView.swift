//
//  ContentView.swift
//  Aula08
//
//  Created by Turma01-12 on 29/08/24.
//

import SwiftUI

let backgroundGradient = LinearGradient(
    gradient: Gradient(colors: [Color.blue, Color.black]),
    startPoint: .top, endPoint: .center)

struct ContentView: View {
    var body: some View {
        ZStack {
            backgroundGradient
                .ignoresSafeArea()
            VStack {
                Image(.truck)
                    .resizable()
                    .frame(width: 200, height: 100)
                
                // Spacer()
                
                VStack{
                    Text("HackaFM")
                        .colorInvert()
                        .font(.largeTitle)
                        .bold()
                    
                    HStack{
                        Image(.truck)
                            .resizable()
                            .frame(width: 40, height: 20, alignment: .leading)
                        Text("HackaSong")
                            .frame(alignment: .leading)
                            .colorInvert()
                            .font(.headline)
                            .bold()
                    }
                }.frame(maxWidth: .infinity, alignment: .leading)
                
                ScrollView {
                    VStack(spacing: 20) {
                        ForEach(0..<10) {
                            Text("Item \($0)")
                                .foregroundStyle(.white)
                                .font(.title2)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(.clear)
                        }
                        
                    }
                    VStack{
                        Text("Sugeridos")
                            .colorInvert()
                            .font(.title)
                            .bold()
                    }
                    .padding([.top],60)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    HStack{
                        
                    }
                    
                }
                .frame(height: 350)
            }
            
            
            
        }
        .accentColor(Color.black)
    }
}

struct Song : Identifiable {
    var id: Int
    var name : String
    var artist : String
    var capa : String
}

var arraySongs = {
    Song(id: 1, name: "Supermassivel Black Hole", artist: "Muse", capa:"simulationTheory")
}

#Preview {
    ContentView()
}
