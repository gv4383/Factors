//
//  ConfigViewModel.swift
//  Factors
//
//  Created by Goyo Vargas on 1/16/22.
//

import Foundation

final class ConfigViewModel: ObservableObject {
    
    @Published var selectedNumberOfQuestions = 1
    @Published var multiplicationTable = 1
    
    let numberOfQuestions = [1, 5, 10, 20]
}
