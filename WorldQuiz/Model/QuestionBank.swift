//
//  QuestionBank.swift
//  WorldQuiz
//
//  Created by TOUALBI Amine  on 11/04/2020.
//  Copyright © 2020 ToualbiApps. All rights reserved.
//

import Foundation

class QuestionBank {
    
    var listOfQuestions = [Question]()
    
    init(country: String) {
        
        if country == "France" {
            listOfQuestions.append(Question(questionText: "In Paris, most people drive their cars to get around.", answer: false))
            
            listOfQuestions.append(Question(questionText: "Dinner is usually around 6 p.m.", answer: false))
            
            listOfQuestions.append(Question(questionText: "You greet friends and family by kissing them on the cheeks.", answer: true))
            
            listOfQuestions.append(Question(questionText: "It is common to ask random people about their day or how they are doing.", answer: false))
            
            listOfQuestions.append(Question(questionText: "You need a visa to travel to Italy from France.", answer: false))
            
            
            listOfQuestions.append(Question(questionText: "It is uncommon to be interrupted when starting a conversation without saying hello (bonjour).", answer: false))
            
            listOfQuestions.append(Question(questionText: "Most grocery stores are closed on Sunday.", answer: true))
                        
            listOfQuestions.append(Question(questionText: "The metro in Paris is open 24/7.", answer: false))
            
            listOfQuestions.append(Question(questionText: "Most french people speak fluently English and you can interact directly with them in English.", answer: false))
            
            listOfQuestions.append(Question(questionText: "At restaurants, drink prices include a certain number of refills.", answer: false))
            
        }
        
    }
    
}
