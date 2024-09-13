//
//  TopView.swift
//  MonitorDeQueimadas
//
//  Created by Turma01-11 on 10/09/24.
//

import SwiftUI

struct TopView : View{
    var topinfo : topInfo
    var body: some View{
        ZStack{
            LinearGradient(colors:[.orange,.white],startPoint: .topLeading,endPoint: .bottomLeading).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/).padding(/*@START_MENU_TOKEN@*/EdgeInsets()/*@END_MENU_TOKEN@*/)
            HStack(alignment: .center){
                Spacer()
                    AsyncImage(url : topinfo.logo){image in
                        image
                            .resizable()
                            .frame(maxWidth: 50, maxHeight: 50)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/).padding(/*@START_MENU_TOKEN@*/EdgeInsets()/*@END_MENU_TOKEN@*/)
                    }placeholder: {
                        ProgressView()
                    }
                    Spacer()
                }
        }.frame(height: 50)
    }
}
