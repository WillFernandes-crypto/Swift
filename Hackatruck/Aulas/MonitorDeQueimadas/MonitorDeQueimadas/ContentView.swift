//
//  ContentView.swift
//  MonitorDeQueimadas
//
//  Created by Turma01-11 on 06/09/24.
//

import SwiftUI

struct ContentView: View {
    @State var selectedTab = 0
    @State var topinfo : topInfo = topInfo(logo: URL(string: "https://img.freepik.com/vetores-gratis/vetor-de-gradiente-de-logotipo-colorido-de-passaro_343694-1365.jpg?size=338&ext=jpg&ga=GA1.1.2008272138.1725753600&semt=ais_hybrid"))
    var body: some View {
        ZStack{
            VStack{
                TopView(topinfo: topinfo).ignoresSafeArea()
                TabView(selection: $selectedTab){
                    HomeView().tag(0)
                    
                    NewsView().tag(1)
                    ComplaintsView().tag(2)

                    MapView().tag(3)

                    DataView().tag(4)

                }
                ZStack{
                    HStack{
                        ForEach((TabbedItems.allCases), id: \.self){ item in
                            Button{
                                selectedTab = item.rawValue
                            } label: {
                                CustomTabItem(imageName: item.iconName, title: item.title, isActive: (selectedTab == item.rawValue))
                            }
                        }
                    }
                    .padding(6)
                }
                .frame(height: 70)
                .background(.orange.opacity(0.5))
                .cornerRadius(35)
                .padding(.horizontal, 26)
            }
        }
    }
}

#Preview {
    ContentView()
}


enum TabbedItems: Int, CaseIterable{
    case home = 0
    case news
    case complaints
    case map
    case data
    
    var title: String{
        switch self {
        case .home:
            return "Home"
        case .news:
            return "Notícias"
        case .complaints:
            return "Denúncias"
        case .map:
            return "Mapa"
        case .data:
            return "Dados"
        }
    }
     
     var iconName: String{
         switch self {
         case .home:
             return "home-icon"
         case .news:
             return "jornal-icon"
         case .complaints:
             return "alert-icon"
         case .map:
             return "map-icon"
         case .data:
             return "data-icon"
         }
     }
 }

extension ContentView{
    func CustomTabItem(imageName: String, title: String, isActive: Bool) -> some View{
         HStack(spacing: 10){
             Spacer()
             Image(imageName)
                 .resizable()
                 .renderingMode(.template)
                 .foregroundColor(isActive ? .black : .white)
                 .frame(width: 20, height: 20)
             if isActive{
                 Text(title)
                     .font(.system(size: 14))
                     .foregroundColor(isActive ? .black : .gray).lineLimit(1)
             }
             Spacer()
         }
         .frame(width: isActive ? 90 : 60, height: 60)
         .background(isActive ? .orange.opacity(0.4) : .clear)
         .cornerRadius(30).shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
     }
}
