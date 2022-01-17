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
    @Published var alertTitle = ""
    @Published var alertMessage = ""
    @Published var showingAlert = false
    
    func checkAnswer(firstNumber: Int,
        secondNumber: Int,
        userInput: Int,
        questionList: [Int]
    ) {
        self.userInput = ""
        
        if userInput != firstNumber * secondNumber {
            alertTitle = "Wrong"
            alertMessage = "Wrong answer! Try again..."
        } else {
            alertTitle = "Correct"
            alertMessage = "Your answer was correct!"
            
            if currentQuestion + 1 >= questionList.count {
                alertTitle = "Done"
                alertMessage = "You have completed all of your questions!\n\nPlease go back to the main page to practice again."
            } else {
                currentQuestion += 1
            }
        }
        
        showingAlert = true
    }
}
