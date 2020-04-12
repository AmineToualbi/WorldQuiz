//
//  ViewController.swift
//  WorldQuiz
//
//  Created by TOUALBI Amine  on 11/04/2020.
//  Copyright © 2020 ToualbiApps. All rights reserved.
//

import UIKit

class QuizVC: UIViewController {
    
    
    //UI Elements:
    var questionLabel: UILabel!
    var trueButton: UIButton!
    var falseButton: UIButton!
    var scoreLabel: UILabel!
    var quizStatus: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blue
                
        questionLabel = UILabel()
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        questionLabel.contentMode = .scaleAspectFill
        questionLabel.clipsToBounds = true
        questionLabel.textColor = .white
        questionLabel.font = UIFont(name: "HelveticaNeue-Thin", size: 18)
        questionLabel.adjustsFontSizeToFitWidth = true
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
        print("TRUE")
    }
    @objc func falsePressed(sender: UIButton) {
        print("FALSE")
    }
    


}

