//
//  ContentView.swift
//  Factors
//
//  Created by Goyo Vargas on 11/23/21.
//

import SwiftUI

struct ContentView: View {
    @State private var numberOfQuestions = [1, 5, 10, 20]
    @State private var selectedNumberOfQuestions = 0
    
    @State private var multiplicationTable = 2
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("How many questions do you want to do?")) {
                    Picker("Number of questions", selection: $selectedNumberOfQuestions) {
                        ForEach(0..<numberOfQuestions.count) { index in
                            Text("\(numberOfQuestions[index])")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Which multiplication table do you want to practice?")) {
                    Stepper("\(multiplicationTable)", value: $multiplicationTable, in: 1...12)
                }
            }
            .navigationTitle("Factors")
        }
    }
    
//    func generateQuestions(numberOfQuestions: Int) -> [Int] {
//        guard numberOfQuestions > 0 else {
//            return []
//        }
//
//        let questions = Array(repeating: 0, count: numberOfQuestions)
//
//        return questions.map { _ in
//            Int.random(in: 0...12)
//        }
//    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
