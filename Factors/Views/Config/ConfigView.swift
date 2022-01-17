//
//  ContentView.swift
//  Factors
//
//  Created by Goyo Vargas on 11/23/21.
//

import SwiftUI

struct ConfigView: View {
    
    @ObservedObject private var viewModel = ConfigViewModel()
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    VStack {
                        Picker(
                            "Number of questions",
                            selection: $viewModel.selectedNumberOfQuestions
                        ) {
                            ForEach(viewModel.numberOfQuestions, id: \.self) {
                                Text("\($0)")
                            }
                        }
                    }
                }
                
                Section {
                    Stepper(
                        "Multiplication table: \(viewModel.multiplicationTable)",
                        value: $viewModel.multiplicationTable,
                        in: 1...12
                    )
                }
                
                Section {
                    NavigationLink {
                        QuestionsView(
                            selectedNumberOfQuestions: viewModel.selectedNumberOfQuestions,
                            multiplicationTable: viewModel.multiplicationTable
                        )
                    } label: {
                        Text("Start practicing")
                    }
                }
            }
            .navigationTitle("Factors")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ConfigView()
    }
}
