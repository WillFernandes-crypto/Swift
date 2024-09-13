//
//  quadroCarrosel.swift
//  MonitorDeQueimadas
//
//  Created by Turma01-11 on 09/09/24.
//

import Foundation

struct quadroCarrossel : Hashable, Decodable{
    let imageURL : URL?
    let caption : String?
    
    private enum CodingKeys: String, CodingKey{
        case imageURL = "urlToImage"
        case caption = "description"
    }
    
}
