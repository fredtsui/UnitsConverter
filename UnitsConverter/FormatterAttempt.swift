//
//  FormatterAttempt.swift
//  UnitsConverter
//
//  Created by Fred Tsui on 2/28/24.
//

import SwiftUI
import SwiftData

struct FormatterAttempt: View {
    // variables
    @State var fromAmount = 0.0
    @State var toAmount = 0.0
    @State var selectedFromUnit = ""
    @State var selectedToUnit = ""
    let unitStyle = Measurement<UnitLength>.FormatStyle(
        width: .abbreviated,
        usage: .asProvided,
        numberFormatStyle: .number.precision(.fractionLength(1))
    )
    
    // list of units to choose from
    let listOfUnits = ["meters", "feet"]
    
    
    var body: some View {
        Form {
            Section{
                // UI to enter amount and unit to convert from
                HStack{
                    Picker("Select Unit to Convert From", selection: $selectedFromUnit) {
                        ForEach(listOfUnits, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    TextField("Enter Amount to:", value: $fromAmount, format: .number)
                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                }
                Spacer()
                // display the converted units
                HStack{
                    
                    Spacer()
                    if selectedFromUnit == "meters" {
                        let switchToMeasurement = Measurement(value: fromAmount, unit: UnitLength.meters).converted(to: UnitLength.feet)
                        Text("\(switchToMeasurement.formatted(unitStyle))")
                            .font(.largeTitle)
                    } else {
                        let switchToMeasurement = Measurement(value: fromAmount, unit: UnitLength.feet).converted(to: UnitLength.meters)
                        Text("\(switchToMeasurement.formatted(unitStyle))")
                            .font(.largeTitle)
                    }
                    
                }
            }
            Section{
                Text("To units selected is: \(selectedFromUnit)")
                Text(selectedToUnit)
                var switchToMeasurement = Measurement(value: fromAmount, unit: UnitLength.meters).converted(to: UnitLength.feet)
                Text("\(switchToMeasurement.formatted())")
                
            }
        }
    }
}

#Preview {
    FormatterAttempt()
        .modelContainer(for: Item.self, inMemory: true)
}
