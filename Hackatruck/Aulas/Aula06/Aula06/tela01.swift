//
//  tela01.swift
//  Aula06
//
//  Created by Turma01-12 on 27/08/24.
//

import SwiftUI

struct tela01: View {
    var body: some View {
        paintbrush()
        VStack{
            NavigationLink(destination: tela01()){
                Text("Mostrar")
            }
        }
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    tela01()
}
