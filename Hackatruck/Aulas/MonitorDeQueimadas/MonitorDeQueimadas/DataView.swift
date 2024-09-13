//
//  DataView.swift
//  MonitorDeQueimadas
//
//  Created by Turma01-11 on 06/09/24.
//

//
//  ContentView.swift
//  queimadas
//
//  Created by Turma01-7 on 09/09/24.
//

import SwiftUI
import Charts

struct DataView: View {
    
    let juaData: [CityData] = [CityData(type: "Juazeiro do Norte", year: 2000, population: 6.8),
                               CityData(type: "Crato", year: 2010, population: 8.2),
                               CityData(type: "Barbalha", year: 2015, population: 12.9),
                               CityData(type: "Missão Velha", year: 2022, population: 15.2)]
    
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
                            .bold().padding()
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding([.bottom], 20)
                    
                    VStack{
                        
                        VStack{
                            
                            Spacer()
                            
                            Text("Gráfico 1")
                                .font(.title2)
                                .frame(alignment: .leading)
                            
                            Chart {
                                BarMark(x: .value("Type", "Juazeiro"),
                                        y: .value("Population", 1))
                                .opacity(0.5)
                                
                                BarMark(x: .value("Type", "Crato"),
                                        y: .value("Population", 2))
                                .opacity(0.5)
                                
                                BarMark(x: .value("Type", "Barbalha"),
                                        y: .value("Population", 3))
                            }.frame(width: 200,height:200)
                            .aspectRatio(1, contentMode: .fit)
                            .padding()
                            
                            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec efficitur, arcu ac euismod mattis, mauris leo blandit velit, nec maximus lorem ex et arcu. Vestibulum gravida, tortor eget iaculis accumsan, leo metus semper lorem, et scelerisque dui sem nec sapien. Nulla leo nisi, hendrerit ac libero eu, feugiat suscipit magna.")
                                .lineLimit(10)
                                .allowsTightening(true)
                                .minimumScaleFactor(0.8)
                                .multilineTextAlignment(.center)
                                .padding()
                            
                            Text("Gráfico 2")
                                .font(.title2)
                                .lineLimit(10)
                                .allowsTightening(true)
                                .minimumScaleFactor(0.8)
                            
                            Chart {
                                ForEach(juaData, id:\.self) { data in
                                    
                                    LineMark(x: .value("Year", data.year),
                                             y: .value("Population", data.population))
                                    
                                }
                                .interpolationMethod(.cardinal)
                                .symbol(by: .value("Cidade", "Juazeiro do Norte"))
                                
                                ForEach(juaData, id:\.self) { data in
                                    AreaMark(x: .value("Year", data.year),
                                             y: .value("Population", data.population))
                                }
                                .interpolationMethod(.cardinal)
                                .foregroundStyle(linearGradient)
                            }.frame(width: 200,height:200)
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
                            
                            Text("Lorem ipsum dolor")
                                .lineLimit(10)
                                .allowsTightening(true)
                                .minimumScaleFactor(0.8)
                                .padding()
                            
                        }
                        .frame(maxWidth: .infinity)
                    }.padding(/*@START_MENU_TOKEN@*/EdgeInsets()/*@END_MENU_TOKEN@*/)
                }
            }
        }
    }
}

struct CityData: Identifiable, Equatable, Hashable {
    let type: String
    let year: Int
    let population: Double
    
    var id: String { return type }
}

struct CityDataSeries: Identifiable, Hashable {
    let type: String
    let cityData: [CityData]
    var id: String { type }
}

let juaData: [CityData] = [CityData(type: "Juazeiro", year: 2000, population: 6.8),
                           CityData(type: "Juazeiro", year: 2010, population: 8.2),
                           CityData(type: "Juazeiro", year: 2015, population: 12.9),
                           CityData(type: "Juazeiro", year: 2022, population: 15.2)]

let cratoData: [CityData] = [CityData(type: "Crato", year: 2000, population: 5),
                          CityData(type: "Crato", year: 2010, population: 5.3),
                          CityData(type: "Crato", year: 2015, population: 7.9),
                          CityData(type: "Crato", year: 2022, population: 10.6)]

var data: [CityDataSeries] {
    [
        CityDataSeries(type: "Juazeiro", cityData: juaData),
     CityDataSeries(type: "Crato", cityData: cratoData)
    ]
}

let linearGradient = LinearGradient(gradient: Gradient(colors: [Color.accentColor.opacity(0.4), Color.accentColor.opacity(0)]),
                                    startPoint: .top,
                                    endPoint: .bottom)


#Preview {
    ContentView()
}
