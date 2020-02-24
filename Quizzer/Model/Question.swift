//
//  Question.swift
//  Quizzer
//
//  Created by ERNEST MURIUKI on 2/19/20.
//  Copyright © 2020 ERNEST MURIUKI. All rights reserved.
//

import Foundation

class Question {
    
    let questionText: String
    let answer: Bool
     
    init(text: String, correctAnswer: Bool){
        questionText = text
        answer = correctAnswer
        
    }
}
