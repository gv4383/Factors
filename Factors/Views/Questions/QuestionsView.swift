//
//  QuestionsView.swift
//  Factors
//
//  Created by Goyo Vargas on 1/9/22.
//

import SwiftUI

struct QuestionsView: View {
    
    @ObservedObject private var viewModel = QuestionsViewModel()
    
    let selectedNumberOfQuestions: Int
    let multiplicationTable: Int
    let questionList: [Int]
    
    var body: some View {
        VStack {
            Text("\(multiplicationTable) x \(questionList[viewModel.currentQuestion])")
            
            TextField("Type your answer here", text: $viewModel.userInput)
                .keyboardType(.numberPad)
                .textFieldStyle(.roundedBorder)
            
            Button("Submit") {
                viewModel.checkAnswer(
                    firstNumber: multiplicationTable,
                    secondNumber: questionList[viewModel.currentQuestion],
                    userInput: Int(viewModel.userInput) ?? 0,
                    questionList: questionList
                )
            }
        }
        .alert(isPresented: $viewModel.showingAlert) {
            Alert(
                title: Text(viewModel.alertTitle),
                message: Text(viewModel.alertMessage),
                dismissButton: .default(Text("Continue"))
            )
        }
    }
    
    init(selectedNumberOfQuestions: Int, multiplicationTable: Int) {
        self.selectedNumberOfQuestions = selectedNumberOfQuestions
        self.multiplicationTable = multiplicationTable
        
        let questions = Array(repeating: 0, count: selectedNumberOfQuestions)
        
        self.questionList = questions.map { _ in
            Int.random(in: 0...12)
        }
    }
}

struct QuestionsView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionsView(selectedNumberOfQuestions: 2, multiplicationTable: 5)
    }
}
