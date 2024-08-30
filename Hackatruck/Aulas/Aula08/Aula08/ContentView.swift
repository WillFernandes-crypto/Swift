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
        NavigationStack{
            ZStack {
                
                backgroundGradient
                    .ignoresSafeArea()
                
                ScrollView {
                    
                    VStack {
                        
                        Image(.truck)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 200, height: 200)
                            .clipped()
                        
                        VStack{
                            
                            Text("HackaFM")
                            
                                .colorInvert()
                                .font(.largeTitle)
                                .bold()
                            
                            HStack{
                                
                                Image(.truck)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 20, height: 20, alignment: .leading)
                                    .clipped()
                                
                                Text("HackaSong")
                                    .frame(alignment: .leading)
                                    .colorInvert()
                                    .font(.headline)
                                    .bold()
                            }
                            .padding([.bottom], 20)
                            
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        
                        
                        VStack(spacing: 20) {
                            
                            
                            ForEach(arraySongs){ song in
                                NavigationLink(destination: playMusic(song: song)){
                                    HStack{
                                        
                                        AsyncImage(
                                            url: URL(string: song.capa),
                                            content: { image in
                                                image.resizable()
                                                    .frame(width: 40, height: 40, alignment: .leading)
                                            },
                                            placeholder: {
                                                ProgressView()
                                            }
                                            
                                        )
                                        
                                        VStack{
                                            
                                            Text(song.name)
                                                .colorInvert()
                                                .font(.title2)
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                            Text(song.artist)
                                            
                                                .colorInvert()
                                            
                                                .font(.subheadline)
                                            
                                                .frame(maxWidth: .infinity, alignment: .leading)
                                            
                                        }
                                        Spacer()
                                        Image(systemName: "ellipsis")
                                            .colorInvert()
                                    }
                                }
                            }
                            
                            Spacer()
                            
                            VStack{
                                
                                Text("Sugeridos")
                                    .colorInvert()
                                    .font(.title)
                                    .bold()
                                
                            }
                            
                            .padding([.top],60)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            
                            HStack{
                                ScrollView(.horizontal) {
                                    HStack(spacing: 20) {
                                        ForEach(arraySongs){ song in
                                            VStack{
                                                AsyncImage(
                                                    url: URL(string: song.capa),
                                                    content: { image in
                                                        image.resizable()
                                                            .frame(width: 200, height: 200, alignment: .leading)
                                                    },
                                                    placeholder: {
                                                        ProgressView()
                                                    }
                                                    
                                                )
                                                Text(song.name)
                                                    .colorInvert()
                                                    .font(.title2)
                                                    .frame(maxWidth: .infinity, alignment: .leading)
                                            }
                                        }
                                        
                                    }
                                    
                                }
                                
                            }
                            
                        }
                        
                    }
                    
                }
                
            }
            .accentColor(Color.black)
        }
    }
}

struct Song : Identifiable {
    var id: Int
    var name : String
    var artist : String
    var capa : String
}

var arraySongs = [
    Song(id: 1, name: "Algorithm", artist: "Muse", capa: "https://simulationtheory.muse.mu/assets/img/artwork-lambert.jpg"),
    Song(id: 2, name: "Supermassivel Black Hole", artist: "Muse", capa: "https://www.muse.mu/sites/g/files/g2000014236/files/styles/album-cover-new/public/2022-04/Muse%20-%20Black%20Holes%20Packshot.png?itok=q49Vbm5k"),
    Song(id: 3, name: "Supermassivel Black Hole", artist: "Muse", capa: "https://simulationtheory.muse.mu/assets/img/artwork-lambert.jpg"),
    Song(id: 4, name: "Supermassivel Black Hole", artist: "Muse", capa: "https://simulationtheory.muse.mu/assets/img/artwork-lambert.jpg"),
    Song(id: 5, name: "Supermassivel Black Hole", artist: "Muse", capa: "https://simulationtheory.muse.mu/assets/img/artwork-lambert.jpg"),
    Song(id: 6, name: "Supermassivel Black Hole", artist: "Muse", capa: "https://simulationtheory.muse.mu/assets/img/artwork-lambert.jpg"),
    Song(id: 7, name: "Supermassivel Black Hole", artist: "Muse", capa: "https://simulationtheory.muse.mu/assets/img/artwork-lambert.jpg"),
    Song(id: 8, name: "Supermassivel Black Hole", artist: "Muse", capa: "https://simulationtheory.muse.mu/assets/img/artwork-lambert.jpg"),
    Song(id: 9, name: "Supermassivel Black Hole", artist: "Muse", capa: "https://simulationtheory.muse.mu/assets/img/artwork-lambert.jpg")
]

#Preview {
    ContentView()
}
