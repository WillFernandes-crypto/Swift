//
//  NewsView.swift
//  MonitorDeQueimadas
//
//  Created by Turma01-11 on 06/09/24.
//

import SwiftUI

struct NewsView: View {
    //var
    @StateObject var noticiasClient = Client()
    @Environment(\.dismiss) private var dismiss
    @State private var searchText = ""
    @State private var searchIsActive = false

    var body: some View {
        NavigationStack{
            ZStack{
                VStack{
                    ScrollView{
                        Text("Notícias")
                            .foregroundStyle(.black)
                            .font(.system(size: 25))
                            .frame(maxWidth: .infinity, alignment:.leading)
                            .bold()
                            .scenePadding(.bottom).frame(height: 30).padding()
                        

                        VStack(spacing: 15) {
                            ForEach(searchResult, id:\.self) { s in
                                ZStack{
                                    Color.black.opacity(0.2)
                                    NavigationLink(destination: Tela2(noticia: s)){
                                        VStack{
                                            if(s.urlToImage != nil){
                                                AsyncImage(url: URL(string: s.urlToImage!)) { image in
                                                    image
                                                        .resizable()
                                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                                        .scaledToFit()
                                                        .frame(width: 400, height: 150)
                                                        .padding(2)
                                                } placeholder: {
                                                    ProgressView()
                                                }
                                            }else{
                                                AsyncImage(url: URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRNdOx20jBh64p6Dj0R2lr438-aN5oeZzCH7Q&s")) { image in
                                                    image
                                                        .resizable()
                                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                                        .scaledToFit()
                                                        .frame(width: 400, height: 150)
                                                        .padding(2)
                                                } placeholder: {
                                                    ProgressView()
                                                }
                                            }
                                            
                                            VStack{
                                                HStack(alignment:.center){
                                                    Spacer()
                                                    if(s.title != nil){
                                                        Text(s.title!)
                                                            .foregroundStyle(.black)
                                                            .font(.system(size: 17))
                                                            .bold().lineLimit(2)
                                                    }else{
                                                        Text("...")
                                                    }
                                                    Spacer()
                                                }.multilineTextAlignment(.leading)
                                                    .padding(.bottom, 0.1)
                                                
                                                HStack{
                                                    Text(s.description!)
                                                        .font(.system(size:15))
                                                        .foregroundStyle(.black).lineLimit(2)
                                                }.multilineTextAlignment(.leading)
                                                Spacer()
                                                
                                            }.padding(.init(top: 0, leading: 35, bottom: 10, trailing: 35))
                                        }
                                        
                                        
                                    }

                                }
                            }.frame(width: 350,height: 280).clipShape(RoundedRectangle(cornerRadius: 15.0)).padding(/*@START_MENU_TOKEN@*/EdgeInsets()/*@END_MENU_TOKEN@*/)
                        }
                    }
                }
                
            }
        }.searchable(text:$searchText).navigationBarBackButtonHidden().toolbar{
            ToolbarItem(placement: .topBarLeading){
                Button{
                    dismiss()
                }label :{
                    HStack{
                        Image(systemName: "arrowshape.backward.circle").foregroundStyle(LinearGradient(colors: [.orange,.orange], startPoint: .topTrailing, endPoint: .center)).font(.system(size: 30))
                    }
                }
            }
        }.onAppear{
            noticiasClient.searchNoticias()
        }
    }
    
    var searchResult: [Noticia]{
        if searchText.isEmpty{
            return noticiasClient.noticias
        }else{
            return noticiasClient.noticias.filter{
                if($0.title != nil){
                    $0.title!.contains(searchText)
                }else{
                    $0.description!.contains(searchText)
                }}
        }
    }
}






#Preview {
    NewsView()
}

