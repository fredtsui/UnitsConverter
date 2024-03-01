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
                }
                Spacer()
                // display the converted units
                HStack{
                    Picker("Select Unit to Convert From", selection: $selectedToUnit) {
                        ForEach(listOfUnits, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    Spacer()
                    Text("displayConverted")
                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                }

                
            }
        }
    }
}

#Preview {
    FormatterAttempt()
        .modelContainer(for: Item.self, inMemory: true)
}
