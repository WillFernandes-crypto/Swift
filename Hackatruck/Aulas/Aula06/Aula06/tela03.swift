//
//  tela03.swift
//  Aula06
//
//  Created by Turma01-12 on 28/08/24.
//

import SwiftUI

struct tela03: View {
    var body: some View {
        ZStack{
            Color.gray
            Image(systemName: "circle.fill")
                .resizable()
                .frame(maxWidth: 300, maxHeight: 300, alignment: .center)
            
            HStack{
                Image(systemName: "paintpalette")
                    .resizable()
                    .frame(maxWidth: 200, maxHeight: 200, alignment: .center)
                    .foregroundStyle(.gray)
            }
        }
    }
}

#Preview {
    tela03()
}
