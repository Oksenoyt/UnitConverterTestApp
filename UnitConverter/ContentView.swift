//
//  ContentView.swift
//  UnitConverter
//
//  Created by Arseniy Oksenoyt on 2/27/24.
//

import SwiftUI

struct ContentView: View {
    @State private var input = 100.0
    @State private var inputUnit = UnitLength.meters
    @State private var outputUnit = UnitLength.kilometers
    @State private var output = 100.0
    
    let lenghUnits: [UnitLength] = [.meters, .feet, .yards, .miles, .kilometers]
    let formatter: MeasurementFormatter
    
    var result: String {
        let inputMeasurement = Measurement(value: input, unit: inputUnit)
        let outputMeasurement = inputMeasurement.converted(to: outputUnit)
        return formatter.string(from: outputMeasurement)
    }
    
    init() {
        formatter = MeasurementFormatter()
        formatter.unitOptions = .providedUnit
        formatter.unitStyle = .long
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Enter initial lenght") {
                    Picker("Convert from", selection: $inputUnit) {
                        ForEach(lenghUnits, id: \.self) {
                            Text(formatter.string(from: $0).capitalized)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    TextField("Amount", value: $input, format: .number)
                }
                
                Section("Choose outout lengh type") {
                    Picker("Convert to", selection: $outputUnit) {
                        ForEach(lenghUnits, id: \.self) {
                            Text(formatter.string(from: $0).capitalized)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    Text(result)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
