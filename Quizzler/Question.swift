//
//  Question.swift
//  Quizzler
//
//  Created by Kassandra Zimmerman on 1/24/19.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import Foundation

class Question {
    
    //Properties
    let questionText : String
    let correctAnswer : Bool
    
    //initializer
    init (text : String, answer : Bool) {
        questionText = text
        correctAnswer = answer
    }
    
}
