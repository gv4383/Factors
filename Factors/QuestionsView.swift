//
//  QuestionsView.swift
//  Factors
//
//  Created by Goyo Vargas on 1/9/22.
//

import SwiftUI

struct QuestionsView: View {
    @State private var userInput = ""
    @State private var currentQuestion = 0
    
    let selectedNumberOfQuestions: Int
    let multiplicationTable: Int
    let questionList: [Int]
    
    init(selectedNumberOfQuestions: Int, multiplicationTable: Int) {
        self.selectedNumberOfQuestions = selectedNumberOfQuestions
        self.multiplicationTable = multiplicationTable
        
        let questions = Array(repeating: 0, count: selectedNumberOfQuestions)
        
        self.questionList = questions.map { _ in
            Int.random(in: 0...12)
        }
    }
    
    func checkAnswer(firstNumber: Int, secondNumber: Int, userInput: Int) {
        guard userInput == firstNumber * secondNumber else {
            print("Wrong answer! Try again...")
            return
        }
        
        print("Correct!")
        self.userInput = ""
        
        guard currentQuestion + 1 < questionList.count else {
            print("No more questions!")
            return
        }
        
        self.currentQuestion += 1
    }
    
    var body: some View {
        VStack {
            Text("\(multiplicationTable) x \(questionList[currentQuestion])")
            
            TextField("Type your answer here", text: $userInput)
                .keyboardType(.numberPad)
            
            Button("Submit") {
                checkAnswer(firstNumber: multiplicationTable, secondNumber: questionList[currentQuestion], userInput: Int(userInput) ?? 0)
            }
        }
    }
}

struct QuestionsView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionsView(selectedNumberOfQuestions: 2, multiplicationTable: 5)
    }
}
