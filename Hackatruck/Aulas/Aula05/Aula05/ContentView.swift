import SwiftUI

struct ContentView: View {
    @State private var peso: String = ""
    @State private var altura: String = ""
    @State private var imcResult: String = ""
    @State private var resultColor: Color = .bg
    
    var body: some View {
        ZStack {
            Color(resultColor)
                .edgesIgnoringSafeArea(.all)
            
            VStack (spacing: 10) {
                Text("Calculadora de IMC")
                    .font(.title)
                    .frame(maxWidth: .infinity, alignment: .top)
                    .padding(.bottom)
                
                NumberTextField(number: $peso, placeholder: "Insira o peso")
                NumberTextField(number: $altura, placeholder: "Insira a altura")
                
                Button(action: {
                    self.calculateIMC()
                }) {
                    Text("Calcular")
                        .frame(width: 100)
                        .padding(15)
                        .foregroundColor(.white)
                        .background(.blue)
                        .cornerRadius(10)
                }
                
                Spacer()
                
                Text(imcResult)
                    .padding()
                    .foregroundColor(.white)
                    .font(.system(size: 26))
                
                Spacer()
                
                Image(.tabelaIMC)
                    .resizable()
                    .frame(minWidth: 500)
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 200, alignment: .center)
                    .scaledToFit()
            }
        }
    }
    
    private func calculateIMC() {
        if let peso = Decimal(string: peso), let altura = Decimal(string: altura), altura > 0 {
            let result = peso / (altura * altura)
            if result < 18.5 {
                imcResult = "Baixo peso"
                resultColor = .baixoPeso
            } else if result < 24.9 {
                imcResult = "Peso normal"
                resultColor = .pesoNormal
            } else if result < 29.9 {
                imcResult = "Sobrepeso"
                resultColor = .sobrepeso
            } else {
                imcResult = "Obesidade"
                resultColor = .obesidade
            }
        } else {
            imcResult = "Valores inválidos"
            resultColor = .gray
        }
    }
}

struct NumberTextField: View {
    @Binding var number: String
    var placeholder: String
    
    var isNumberValid: Bool {
        return Float(number) != nil || number.isEmpty
    }
    
    // Formata o texto da altura conforme o usuário digita
    private func formatAltura(_ value: String) -> String {
        let digits = value.replacingOccurrences(of: ".", with: "")
        
        if digits.count > 1 {
            let integerPart = digits.prefix(1)
            let decimalPart = digits.suffix(digits.count - 1)
            return "\(integerPart).\(decimalPart)"
        }
        return digits
    }
    
    var body: some View {
        VStack {
            TextField(placeholder, text: Binding(
                get: {
                    self.number
                },
                set: {
                    self.number = formatAltura($0)
                }
            ))
            .multilineTextAlignment(.center)
            .padding(8)
            .frame(width: 350)
            .background(.white)
            .keyboardType(.decimalPad)
            .cornerRadius(10)
            .padding(12)
            
        }
    }
}

#Preview {
    ContentView()
}
