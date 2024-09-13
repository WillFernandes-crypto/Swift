//
//  noticia.swift
//  MonitorDeQueimadas
//
//  Created by Turma01-11 on 11/09/24.
//

import Foundation


struct Response : Decodable{
    var totalResults : Int
    var articles : [Noticia]?

}

struct Carrossel : Decodable{
    var totalResults: Int
    var articles: [quadroCarrossel]?
}

struct Noticia : Hashable, Decodable{
    var urlToImage : String?
    var content : String?
    var publishedAt : String?
    var description : String?
    var title : String?
    var url : String?
}
