//
//  playMusic.swift
//  Aula08
//
//  Created by Turma01-12 on 30/08/24.
//

import SwiftUI

struct playMusic: View {
    @State var song: Song

    var body: some View {
        ZStack {
            
            backgroundGradient
                .ignoresSafeArea()
            
            VStack{
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
                        .frame(maxWidth: .infinity, alignment: .center)
                    Text(song.artist)
                        .colorInvert()
                        .font(.title2)
                        .frame(maxWidth: .infinity, alignment: .center)
                        
                }
                .multilineTextAlignment(.center)
                .padding()
                
                HStack{
                    Image(systemName: "shuffle")
                        .font(.system(size: 30))
                    Spacer()
                    Image(systemName: "backward.end.fill")
                        .font(.system(size: 30))
                    Spacer()
                    Image(systemName: "play.fill")
                        .font(.system(size: 60))
                    Spacer()
                    Image(systemName: "forward.end.fill")
                        .font(.system(size: 30))
                    Spacer()
                    Image(systemName: "repeat")
                        .font(.system(size: 30))
                }
                .colorInvert()
            }
            
        }
        .accentColor(Color.black)
    }
}

#Preview {
    playMusic(song: Song(id: 0, name: "", artist: "", capa: ""))
}
