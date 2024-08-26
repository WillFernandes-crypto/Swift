//
//  ContentView.swift
//  Aula05
//
//  Created by Turma01-12 on 23/08/24.
//

import SwiftUI

struct ContentView: View {
    @State private var calcular = false
    @State public var peso: String = ""
    @State public var altura: String = ""
    @State public var result: Decimal = 0
    @State public var teste: String = ""
    
    var body: some View {
        ZStack {
            Color("bg")
                .edgesIgnoringSafeArea(.all)
            
            VStack (spacing: 10) {
                Text("Calculadora de IMC")
                    .font(.title)
                    .frame(maxWidth: .infinity, alignment: .top)
                    .fontWeight(.bold)
                
                
                NumberTextField(number: $peso, placeholder: "Insira o peso")
                NumberTextField(number: $altura, placeholder: "Insira a altura")
                
                
                OperationButton(operation: "Calcular", action: imc)
                
                HStack {
                    Spacer()
                    TestTextField(test: $teste)
                    Spacer()
                }
                Spacer()
            }
        }
    }
    
    private func imc() {
        
        if let num1 = Decimal(string: peso), let num2 = Decimal(string: altura) {
            result = (num1 / (num2*num2))
        }
        
        if (result > 0 ) {
            if (result > 0 && result < 18.5) {
                teste = "1"
            } else if (result >= 18.5 && result <= 24.99){
                teste = "2"
            } else if (result >= 25 && result <= 29.99){
                teste = "3"
            } else if (result >= 30){
                teste  = "4"
            }
        }
    }
}

struct NumberTextField: View {
    @Binding var number: String
    var placeholder: String
    
    // Computed property to check if the input is a valid number
    var isNumberValid: Bool {
        return Float(number) != nil || number.isEmpty
    }
    
    var body: some View {
        VStack {
            TextField(placeholder, text: $number)
                .keyboardType(.decimalPad)
                .padding(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.black, lineWidth: 2)
                )
                .background(Color.white)
                .padding(.horizontal, 12)
            
            if !isNumberValid {
                Text("Please enter a valid number")
                    .font(.caption)
                    .foregroundColor(.red)
            }
        }
    }
}

struct TestTextField: View {
    @Binding var test: String
    
    var body: some View {
        VStack {
            if test == "1"{
                Text("Baixo peso")
                    .foregroundColor(.red)
            }
        }
    }
}

struct OperationButton: View {
    let operation: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(operation)
        }
        .padding(.horizontal, 24)
        .padding(.bottom, 12)
    }
}

#Preview {
    ContentView()
}
