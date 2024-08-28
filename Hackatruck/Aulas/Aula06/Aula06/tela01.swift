//
//  paintbrush.swift
//  Aula06
//
//  Created by Turma01-12 on 27/08/24.
//

import SwiftUI

struct tela01: View {
    var body: some View {
        ZStack{
            Color.pink
            Image(systemName: "circle.fill")
                .resizable()
                .frame(maxWidth: 300, maxHeight: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
            HStack{
                Image(systemName: "paintbrush")
                    .resizable()
                    .frame(maxWidth: 200, maxHeight: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .foregroundStyle(.pink)
                    
            }
        }
    }
}

#Preview {
    tela01()
}
