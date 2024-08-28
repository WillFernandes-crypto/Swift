//
//  lista.swift
//  Aula06
//
//  Created by Turma01-12 on 28/08/24.
//

import SwiftUI

struct lista: View {
    
    @State private var showSheet = false
    
    var body: some View {
        
        NavigationView {
            
            List {
                VStack{
                    
                    HStack{
                        Text("Item")
                        Spacer()
                        Image(systemName: "paintbrush")
                    }
                    Divider()
                    HStack{
                        Text("Item")
                        Spacer()
                        Image(systemName: "paintbrush.pointed")
                    }
                    Divider()
                    HStack{
                        Text("Item")
                        Spacer()
                        Image(systemName: "paintpalette")
                    }
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("List")
        }
    }
}

#Preview {
    lista()
}
