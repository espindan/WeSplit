//
//  ContentView.swift
//  WeSplit
//
//  Created by Danny Espinoza Sanchez on 1/23/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 0
    @State private var tipPercentage = 20
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var body: some View {
        NavigationView{
            Form{
                Section {
                    //Locale is a massive struct built into iOS that is responsible for storing all the user’s region settings what calendar they use, how they separate thousands digits in numbers, whether they use the metric system, and more
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                        .keyboardType(.decimalPad)//numberPad
                    
                    Picker("Number of people", selection: $numberOfPeople){
                        ForEach(2..<100){
                            Text("\($0) people")
                        }
                    }
                    
                }
            }
            .navigationTitle("WeSplit")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    // Type some View -> return a view that conforms the View protocol
    static var previews: some View {
        ContentView()
    }
}
