//
//  ContentView.swift
//  WeSplit
//
//  Created by Danny Espinoza Sanchez on 1/23/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    @FocusState private var amountIsFocused: Bool
    let tipPercentages = [10, 15, 20, 25, 0, 20]
    let currency = FloatingPointFormatStyle<Double>.Currency(code: Locale.current.currencyCode ?? "USD")
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        return grandTotal / peopleCount
    }
    
    var grandTotal: Double {
        let tipSelection = Double(tipPercentage)
        let tipValue = checkAmount / 100 * tipSelection
        return checkAmount + tipValue
    }
    
    var body: some View {
        NavigationView{
            Form{
                Section {
                    //Locale is a massive struct built into iOS that is responsible for storing all the user’s region settings what calendar they use, how they separate thousands digits in numbers, whether they use the metric system, and more
                    TextField("Amount", value: $checkAmount, format: currency)
                        .keyboardType(.decimalPad)//numberPad
                        .focused($amountIsFocused)
                    
                    Picker("Number of people", selection: $numberOfPeople){
                        ForEach(2..<100){
                            Text("\($0) people")
                        }
                    }
                }
                Section{
                    Picker("Tip percentage", selection: $tipPercentage){
                        ForEach(tipPercentages,id: \.self){
                            Text($0,format: .percent)
                        }
                    }.pickerStyle(.segmented)
                } header: {
                    Text("How much tip do you want to leave?")
                }
                Section{
                    if Double(tipPercentage) == 0{
                        Text(grandTotal,format: currency)
                            .foregroundColor(.red)
                    }else{
                        Text(grandTotal,format: currency)
                    }
                } header: {
                    Text("Total amount for the check")
                }
                Section{
                    Text(totalPerPerson,format: currency)
                } header: {
                    Text("Amount per person")
                }
            }
            .navigationTitle("WeSplit")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    // Type some View -> return a view that conforms the View protocol
    static var previews: some View {
        ContentView()
    }
}
