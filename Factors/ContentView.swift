//
//  ContentView.swift
//  Factors
//
//  Created by Goyo Vargas on 11/23/21.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedNumberOfQuestions = 1
    @State private var multiplicationTable = 1
    
    let numberOfQuestions = [1, 5, 10, 20]
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    Section(header: Text("How many questions do you want to do?")) {
                        Picker("Number of questions", selection: $selectedNumberOfQuestions) {
                            ForEach(numberOfQuestions, id: \.self) {
                                Text("\($0)")
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                    
                    Section(header: Text("What multiplication table do you want to practice?")) {
                        Stepper("\(multiplicationTable)", value: $multiplicationTable, in: 1...12)
                    }
                }
                
                NavigationLink {
                    QuestionsView(
                        selectedNumberOfQuestions: selectedNumberOfQuestions,
                        multiplicationTable: multiplicationTable
                    )
                } label: {
                    Text("Start practicing")
                        .foregroundColor(.white)
                        .padding()
                        .background(.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                
                Spacer()
            }
            .navigationTitle("Factors")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
