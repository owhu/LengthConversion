//
//  ContentView.swift
//  LengthConversion
//
//  Created by Oliver Hu on 12/26/23.
//

import SwiftUI

struct ContentView: View {
    @FocusState private var amountIsFocused: Bool
    @State private var inputUnit = ""
    @State private var outputUnit = ""
    @State private var inputValue = 0.0

    let inputOptions = ["meters", "km", "feet", "yards", "miles"]
    let outputOptions = ["meters", "km", "feet", "yards", "miles"]
    
    var result: String {
        
        var input = 0.0
        var output = 0.00
        
        switch inputUnit {
        case "meters":
              input = inputValue * 3.2808
          case "km":
              input = inputValue * 3280.84
          case "yards":
              input = inputValue * 3
          case "miles":
              input = inputValue * 5280
          case "feet":
              input = inputValue * 1
          default:
              input = inputValue * 3.2808
          }
        
        switch outputUnit {
        case "meters":
            output = input / 3.2808
        case "km":
            output = input / 3280.84
        case "yards":
            output = input / 3
        case "miles":
            output = input / 5280
        case "feet":
            output = input / 1
        default:
            output = input / 3.2808
        }
        
        return String(format: "%.2f", output)
    }
    var body: some View {
        NavigationStack {
            Form {
                Section("Input") {
                    TextField("Value", value: $inputValue, format: .number)
                        .keyboardType(.numberPad)
                        .focused($amountIsFocused)
                }
                Section("Input Unit") {
                    Picker("From", selection: $inputUnit) {
                        ForEach(inputOptions, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section("Output Unit") {
                    Picker("From", selection: $outputUnit) {
                        ForEach(outputOptions, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section("Output") {
                    Text(result)
                }
            }
            .navigationTitle("Unit Conversion")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                if amountIsFocused {
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
