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
            VStack {
                List {
                    Section(header: Text("How many questions do you want to do?")) {
                        Picker(
                            "Number of questions",
                            selection: $viewModel.selectedNumberOfQuestions
                        ) {
                            ForEach(viewModel.numberOfQuestions, id: \.self) {
                                Text("\($0)")
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                    
                    Section(header: Text("What multiplication table do you want to practice?")) {
                        Stepper(
                            "\(viewModel.multiplicationTable)",
                            value: $viewModel.multiplicationTable,
                            in: 1...12
                        )
                    }
                }
                
                NavigationLink {
                    QuestionsView(
                        selectedNumberOfQuestions: viewModel.selectedNumberOfQuestions,
                        multiplicationTable: viewModel.multiplicationTable
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
        ConfigView()
    }
}
