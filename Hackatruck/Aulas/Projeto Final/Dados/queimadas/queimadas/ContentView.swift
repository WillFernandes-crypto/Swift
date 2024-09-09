//
//  ContentView.swift
//  queimadas
//
//  Created by Turma01-7 on 09/09/24.
//

import SwiftUI
import Charts

struct ContentView: View {
    
    let catData: [PetData] = [PetData(type: "cat", year: 2000, population: 6.8),
                              PetData(type: "cat", year: 2010, population: 8.2),
                              PetData(type: "cat", year: 2015, population: 12.9),
                              PetData(type: "cat", year: 2022, population: 15.2)]
    
    let linearGradient = LinearGradient(gradient: Gradient(colors: [Color.accentColor.opacity(0.4),
                                                                    Color.accentColor.opacity(0)]),
                                        startPoint: .top,
                                        endPoint: .bottom)
    
    var body: some View {
        NavigationStack{
            ZStack{
                ScrollView {
                    
                    //titulo
                    HStack{
                        Text("Dados de Queimadas no Cariri")
                            .font(.title)
                            .bold()
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.bottom], 20)
                    
                    VStack{
                        
                        VStack{
                            ForEach(arrayDataInfo){ data in
                                
                                Chart {
                                    BarMark(x: .value("Type", "bird"),
                                            y: .value("Population", 1))
                                    .opacity(0.5)
                                    
                                    BarMark(x: .value("Type", "dog"),
                                            y: .value("Population", 2))
                                    .opacity(0.5)
                                    
                                    BarMark(x: .value("Type", "cat"),
                                            y: .value("Population", 3))
                                }
                                .aspectRatio(1, contentMode: .fit)
                                .padding()
                                
                                Text(data.info)
                                    .lineLimit(10)
                                    .allowsTightening(true)
                                    .minimumScaleFactor(0.8)
                                    .frame(width: .infinity, height: 60)
                                    .border(.red)
                                    .multilineTextAlignment(.center)
                                
                                Chart {
                                    ForEach(catData) { data in
                                        LineMark(x: .value("Year", data.year),
                                                 y: .value("Population", data.population))
                                    }
                                    .interpolationMethod(.cardinal)
                                    .symbol(by: .value("Pet type", "cat"))
                                    ForEach(catData) { data in
                                        AreaMark(x: .value("Year", data.year),
                                                 y: .value("Population", data.population))
                                    }
                                    .interpolationMethod(.cardinal)
                                    .foregroundStyle(linearGradient)
                                }
                                .chartXScale(domain: 1998...2024)
                                .chartLegend(.hidden)
                                .chartXAxis {
                                    AxisMarks(values: [2000, 2010, 2015, 2022]) { value in
                                        AxisGridLine()
                                        AxisTick()
                                        if let year = value.as(Int.self) {
                                            AxisValueLabel(String(year),
                                                           centered: false,
                                                           anchor: .top)
                                        }
                                    }
                                }
                                .aspectRatio(1, contentMode: .fit)
                                .padding()
                                
                                Text(data.info)
                                    .lineLimit(10)
                                    .allowsTightening(true)
                                    .minimumScaleFactor(0.8)
                                    .frame(width: .infinity, height: 60)
                                    .border(.red)
                                    .multilineTextAlignment(.center)
                                
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                        }
                    }
                }
            }
        }
    }
}

struct PetData: Identifiable, Equatable {
    let type: String
    let year: Int
    let population: Double
    
    var id: String { return type }
}

struct PetDataSeries: Identifiable {
    let type: String
    let petData: [PetData]
    var id: String { type }
}

let catData: [PetData] = [PetData(type: "cat", year: 2000, population: 6.8),
                          PetData(type: "cat", year: 2010, population: 8.2),
                          PetData(type: "cat", year: 2015, population: 12.9),
                          PetData(type: "cat", year: 2022, population: 15.2)]

let dogData: [PetData] = [PetData(type: "dog", year: 2000, population: 5),
                          PetData(type: "dog", year: 2010, population: 5.3),
                          PetData(type: "dog", year: 2015, population: 7.9),
                          PetData(type: "dog", year: 2022, population: 10.6)]

var data: [PetDataSeries] {
    [PetDataSeries(type: "cat", petData: catData),
     PetDataSeries(type: "dog", petData: dogData)]
}

let linearGradient = LinearGradient(gradient: Gradient(colors: [Color.accentColor.opacity(0.4), Color.accentColor.opacity(0)]),
                                    startPoint: .top,
                                    endPoint: .bottom)

// Info sobre os graficos
struct Data : Identifiable {
    var id: Int
    var info : String
}

var arrayDataInfo = [
    
    Data(id: 1, info: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec efficitur, arcu ac euismod mattis, mauris leo blandit velit, nec maximus lorem ex et arcu. Vestibulum gravida, tortor eget iaculis accumsan, leo metus semper lorem, et scelerisque dui sem nec sapien. Nulla leo nisi, hendrerit ac libero eu, feugiat suscipit magna."),
    
    Data(id: 2, info: "Lorem ipsum dolor")
    
]



#Preview {
    ContentView()
}
