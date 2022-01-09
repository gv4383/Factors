//
//  QuestionsView.swift
//  Factors
//
//  Created by Goyo Vargas on 1/9/22.
//

import SwiftUI

struct QuestionsView: View {
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
    
    var body: some View {
        VStack {
            Text("Selected number of questions: \(selectedNumberOfQuestions)")
            Text("Multiplication table: \(multiplicationTable)")
        }
    }
}

struct QuestionsView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionsView(selectedNumberOfQuestions: 2, multiplicationTable: 5)
    }
}
