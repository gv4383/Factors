//
//  QuestionsViewModel.swift
//  Factors
//
//  Created by Goyo Vargas on 1/16/22.
//

import Foundation

final class QuestionsViewModel: ObservableObject {
    
    @Published var userInput = ""
    @Published var currentQuestion = 0
    @Published var showingAlert = false
    
    func checkAnswer(firstNumber: Int,
        secondNumber: Int,
        userInput: Int,
        questionList: [Int]
    ) {
        self.userInput = ""
        guard userInput == firstNumber * secondNumber else {
            showingAlert = true
            
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
}
