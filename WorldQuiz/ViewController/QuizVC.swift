//
//  ViewController.swift
//  WorldQuiz
//
//  Created by TOUALBI Amine  on 11/04/2020.
//  Copyright © 2020 ToualbiApps. All rights reserved.
//

import UIKit
import PKHUD

class QuizVC: UIViewController {
    
    
    //UI Elements:
    var questionLabel: UILabel!
    var trueButton: UIButton!
    var falseButton: UIButton!
    var scoreLabel: UILabel!
    var quizStatus: UILabel!
    
    var quizCountry: String!
    var questionBank: QuestionBank!
    var quizQuestions = [Question]()
    var questionNumber: Int!
    var numberOfQuestions: Int!
    var score: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blue
                
        questionLabel = UILabel()
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        questionLabel.contentMode = .scaleAspectFill
        questionLabel.clipsToBounds = true
        questionLabel.textColor = .white
        questionLabel.font = UIFont(name: "HelveticaNeue-Thin", size: 18)
        questionLabel.adjustsFontSizeToFitWidth = false
        questionLabel.numberOfLines = 0
        questionLabel.textAlignment = .center
        questionLabel.text = "QUESTION"
        view.addSubview(questionLabel)
        
        trueButton = UIButton()
        trueButton.translatesAutoresizingMaskIntoConstraints = false
        trueButton.contentMode = .scaleAspectFill
        trueButton.clipsToBounds = true
        trueButton.setTitle("True", for: .normal)
        trueButton.titleLabel?.font = UIFont(name: "HelveticaNeue-Medium", size: 15)
        trueButton.titleLabel?.textColor = .white
        trueButton.backgroundColor = .green
        view.addSubview(trueButton)
        trueButton.addTarget(self, action: #selector(truePressed), for: .touchUpInside)
        
        falseButton = UIButton()
        falseButton.translatesAutoresizingMaskIntoConstraints = false
        falseButton.contentMode = .scaleAspectFill
        falseButton.clipsToBounds = true
        falseButton.setTitle("False", for: .normal)
        falseButton.titleLabel?.font = UIFont(name: "HelveticaNeue-Medium", size: 15)
        falseButton.titleLabel?.textColor = .white
        falseButton.backgroundColor = .red
        view.addSubview(falseButton)
        falseButton.addTarget(self, action: #selector(falsePressed), for: .touchUpInside)
        
        scoreLabel = UILabel()
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        scoreLabel.contentMode = .scaleAspectFill
        scoreLabel.clipsToBounds = true
        scoreLabel.textColor = .white
        scoreLabel.font = UIFont(name: "HelveticaNeue-Thin", size: 18)
        scoreLabel.adjustsFontSizeToFitWidth = true
        scoreLabel.textAlignment = .center
        scoreLabel.text = "Score: 7"
        view.addSubview(scoreLabel)
        
        quizStatus = UILabel()
        quizStatus.translatesAutoresizingMaskIntoConstraints = false
        quizStatus.contentMode = .scaleAspectFill
        quizStatus.clipsToBounds = true
        quizStatus.textColor = .white
        quizStatus.font = UIFont(name: "HelveticaNeue-Thin", size: 18)
        quizStatus.adjustsFontSizeToFitWidth = true
        quizStatus.textAlignment = .center
        quizStatus.text = "x/10"
        view.addSubview(quizStatus)
        
        setupConstraints()
        
        
        /*
         Once all the UI is loaded & laid out correctly on the screen,
         retrieve the country for the quiz that was passed from the cell clicked in the previous table view controller.
         For now, I will hardcode it to be "France".
         */
        quizCountry = "France"
        questionBank = QuestionBank(country: quizCountry)
        quizQuestions = questionBank.listOfQuestions
        score = 0
        questionNumber = 0
        numberOfQuestions = quizQuestions.count
        
        updateUI()
        nextQuestion()
    }
    
    func updateUI() {
        scoreLabel.text = "Score: " + String (score)
        if questionNumber + 1 > numberOfQuestions {     //game over, avoid having 11/10.
            quizStatus.text = String (numberOfQuestions) + "/\(numberOfQuestions!)"
        }
        else {
            quizStatus.text = String (questionNumber + 1) + "/\(numberOfQuestions!)"
        }
    }
    
    func nextQuestion() {
        if questionNumber < numberOfQuestions {
            questionLabel.text = quizQuestions[questionNumber].questionText
        }
        else {
            var endMessage = ""
            if score > numberOfQuestions - 1 {
                print("YOU PASSED.")
                endMessage = "Congratulations, you passed!"
            }
            else {
                print("YOU FAILED.")
                endMessage = "You failed, try again!"
            }
            
            let alert = UIAlertController(title: "End of the Quiz!", message: endMessage, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Try Again", style: .default, handler: { (action: UIAlertAction!) in
                self.restart()
            }))

            alert.addAction(UIAlertAction(title: "Go To Main Menu", style: .cancel, handler: { (action: UIAlertAction!) in
                self.goToMainMenu()
            }))

            present(alert, animated: true, completion: nil)
        }
    }
    
    func restart() {
        questionNumber = 0
        score = 0
        updateUI()
        nextQuestion()
    }
    
    
    //TODO - THIS FUNCTION SHOULD GO BACK TO THE MAIN UITABLEVIEW.
    func goToMainMenu() {
        
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            questionLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            questionLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            questionLabel.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -10),
            questionLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            questionLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40)
        ])
        
        NSLayoutConstraint.activate([
            trueButton.heightAnchor.constraint(equalToConstant: 56),
            trueButton.widthAnchor.constraint(equalToConstant: 128),
            trueButton.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 40),
            trueButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: -25)
        ])
        
        NSLayoutConstraint.activate([
            falseButton.heightAnchor.constraint(equalToConstant: 56),
            falseButton.widthAnchor.constraint(equalToConstant: 128),
            falseButton.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 40),
            falseButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 25)
        ])
        
        NSLayoutConstraint.activate([
            scoreLabel.heightAnchor.constraint(equalToConstant: 21),
            scoreLabel.widthAnchor.constraint(equalToConstant: 116),
            scoreLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            scoreLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ])
        
        NSLayoutConstraint.activate([
            quizStatus.heightAnchor.constraint(equalToConstant: 21),
            quizStatus.widthAnchor.constraint(equalToConstant: 52),
            quizStatus.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            quizStatus.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ])
    }
    
    @objc func truePressed(sender: UIButton) {
        verifyAnswer(choice: true)
        nextQuestion()
    }
    @objc func falsePressed(sender: UIButton) {
        verifyAnswer(choice: false)
        nextQuestion()
    }
    
    
    func verifyAnswer(choice: Bool) {
        if questionNumber < numberOfQuestions {
            let correctAnswer = quizQuestions[questionNumber].answer
            
            if choice == correctAnswer {
                print("Good answer.")
                showHUD(success: true)
                score += 1
                questionNumber += 1
            }
            else {
                print("Wrong answer.")
                showHUD(success: false)
                questionNumber += 1
            }
        }
        updateUI()
    }
    
    func showHUD(success: Bool) {
        HUD.dimsBackground = false
        HUD.allowsInteraction = false
        if success {
            PKHUD.sharedHUD.contentView = PKHUDSuccessView()
            PKHUD.sharedHUD.show()
            PKHUD.sharedHUD.hide(afterDelay: 1.0)
        }
        else {
            PKHUD.sharedHUD.contentView = PKHUDErrorView()
            PKHUD.sharedHUD.show()
            PKHUD.sharedHUD.hide(afterDelay: 0.5)
        }
    }
    


}

