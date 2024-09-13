//
//  HomeView.swift
//  MonitorDeQueimadas
//
//  Created by Turma01-11 on 06/09/24.
//

import SwiftUI

struct HomeView: View {
    @State var topinfo : topInfo = topInfo(logo: URL(string: "https://img.freepik.com/vetores-gratis/vetor-de-gradiente-de-logotipo-colorido-de-passaro_343694-1365.jpg?size=338&ext=jpg&ga=GA1.1.2008272138.1725753600&semt=ais_hybrid"))
    @State private var scrollID : Int?
    @StateObject var carrosselclient = Client()
    var body: some View {
            NavigationStack{
                VStack(){
                    ScrollView(.horizontal,showsIndicators: false){
                        HStack(alignment:.top){
                            Spacer()
                            ForEach(0..<carrosselclient.carrossel.count, id: \.self){index in
                                
                                 let quadro = carrosselclient.carrossel[index]
                                
                                    ZStack{
                                    NavigationStack{
                                        NavigationLink(destination:NewsView()){
                                            VStack{
                                                if(quadro.imageURL != nil){
                                                    AsyncImage(url : quadro.imageURL){ image in
                                                        image
                                                            .resizable()
                                                            .frame(maxWidth: 250,maxHeight: 150)
                                                            .clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/))
                                                    } placeholder: {
                                                        ProgressView()
                                                    }
                                                }else{
                                                    AsyncImage(url : URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1f4C-cWV03_czRXhL1THkOdS9RDnAtPxRnA&s")!){ image in
                                                        image
                                                            .resizable()
                                                            .frame(maxWidth: 250,maxHeight: 150)
                                                            .clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/))
                                                    } placeholder: {
                                                        ProgressView()
                                                    }
                                                }
                                            }
                                            .scrollTransition(.animated, axis: .horizontal){ content,phase in
                                                content.opacity(phase.isIdentity ? 1.0 : 0.6)
                                                    .scaleEffect(phase.isIdentity ? 1.0 : 0.8)
                                                
                                            }
                                        }
                                    }
                                    VStack{
                                        Spacer()
                                        ZStack{
                                            if(quadro.caption != nil){
                                                Color.gray.frame(width: 230,height: 40).opacity(0.5).clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/))
                                                Text(quadro.caption!).foregroundStyle(.white).lineLimit(1)
                                            }else{
                                                Text("...")
                                            }
                                        }
                                    }.scrollTransition(.animated, axis: .horizontal){ content,phase in
                                        content.opacity(phase.isIdentity ? 1.0 : 0.6)
                                            .scaleEffect(phase.isIdentity ? 1.0 : 0.8)
                                    }
                                }.frame(width: 250,height: 150)

                                
}
                            }
                        }.scrollTargetLayout().padding(/*@START_MENU_TOKEN@*/EdgeInsets()/*@END_MENU_TOKEN@*/)
                    }.scrollPosition(id: $scrollID)
                    
                    IndicatorView(carrosselCount: carrosselclient.carrossel.count, scrollID: $scrollID)
                    Spacer()
                    cardFunc()
                    Spacer()
                    
            }.onAppear{
                carrosselclient.searchQuadroCarrossel()
            }
    }
}

#Preview {
    HomeView()
}

struct IndicatorView : View{
    let carrosselCount : Int
    @Binding var scrollID: Int?
    var body: some View{
        HStack{
            ForEach(0..<carrosselCount, id: \.self){indicator in
                if(indicator <= 15){
                    let index = scrollID ?? 0
                    Button{
                        withAnimation{
                            scrollID = indicator
                        }
                    }label: {
                        Image(systemName: "circle.fill").font(.system(size: 8))
                            .foregroundStyle(indicator == index ? Color.white : Color.gray)
                    }
                }
                
            }
        }.padding(7)
            .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray).opacity(0.2))
    }
}




struct cardFunc : View{
    @State var cards : [cardFunction] = [cardFunction(caption:"Notícias" , icon: "newspaper.circle.fill"),cardFunction(caption:"Data" , icon: "chart.dots.scatter"),cardFunction(caption:"Simular" , icon: "sun.max.trianglebadge.exclamationmark.fill"),cardFunction(caption:"Alertas" , icon: "flame.fill")]
    var body : some View{
        NavigationStack{
            VStack{
                HStack{
                    NavigationLink(destination: NewsView()){
                        ZStack{
                            Color.orange.opacity(0.9)
                            VStack{
                                Image(systemName: cards[0].icon).foregroundStyle(Color.red).font(.system(size: 50))
                                Text(cards[0].caption).foregroundStyle(.white)
                            }
                        }.frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/,height: 100).clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)).shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    }
                    NavigationLink(destination: ComplaintsView()){
                        ZStack{
                            Color.orange.opacity(0.9)
                            VStack{
                                Image(systemName: cards[1].icon).foregroundStyle(Color.red).font(.system(size: 50))
                                Text(cards[1].caption).foregroundStyle(.white)
                            }
                        }.frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/,height: 100).clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)).shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    }
                }
                HStack{
                    NavigationLink(destination: MapView()){
                        ZStack{
                            Color.orange.opacity(0.9)
                            VStack{
                                Image(systemName: cards[2].icon).foregroundStyle(Color.red).font(.system(size: 50))
                                Text(cards[2].caption).foregroundStyle(.white)
                            }
                        }.frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/,height: 100).clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)).shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    }
                    NavigationLink(destination: DataView()){
                        ZStack{
                            Color.orange.opacity(0.9)
                            VStack{
                                Image(systemName: cards[3].icon).foregroundStyle(Color.red).font(.system(size: 50))
                                Text(cards[3].caption).foregroundStyle(.white)
                            }
                        }.frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/,height: 100).clipShape(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)).shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    }
                }
            }

        }
    }
}
