//
//  Client.swift
//  MonitorDeQueimadas
//
//  Created by Turma01-11 on 09/09/24.
//

import Foundation

class Client : ObservableObject {
    @Published var carrossel : [quadroCarrossel] = []
    @Published var noticias : [Noticia] = []
   
    func searchQuadroCarrossel(){
        let task = URLSession.shared.dataTask(with: URLRequest(url: URL(string: "https://newsapi.org/v2/everything?q=queimadas&from=2024-08-13&sortBy=publishedAt&apiKey=8afae4e30baa4e6693cd25d6f0bf61ee")!)){data,_, error in
            
            do{
              let resp = try JSONDecoder().decode(Carrossel.self, from: data!)
                self.carrossel = resp.articles!
                
            }catch{
                print(error)
            }
        }
        task.resume()
    }
    
    func searchNoticias(){
        
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: URL(string: "https://newsapi.org/v2/everything?q=queimadas&from=2024-08-13&sortBy=publishedAt&apiKey=8afae4e30baa4e6693cd25d6f0bf61ee")!)){data,_, error in
            
            do{
              let resp = try JSONDecoder().decode(Response.self, from: data!)
                self.noticias = resp.articles!
                
            }catch{
                print(error)
            }
        }
        task.resume()
    }
}
