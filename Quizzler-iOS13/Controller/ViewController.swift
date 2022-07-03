//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var scoreLabel: UILabel!
    
    
    var quizBrain = QuizBrain()
    
    
    override func viewDidLoad() {
        
        questionLabel.text = quizBrain.quiz[quizBrain.questionNumber].question
        
        progressBar.progress = 0.0
        progressBar.progressTintColor = UIColor.green
        
        scoreLabel.textColor = UIColor.white
        // Do any additional setup after loading the view.
    }
    
    @IBAction func answerSelected(_ sender: UIButton) {
        
        var qNumber = quizBrain.questionNumber
        
        let checkAnswer = sender.currentTitle!
        let check = quizBrain.checkAnswer(userAnswer: checkAnswer)
        
        if(quizBrain.getQuestionNumber()<=(quizBrain.questionCount()-1))
        {
            if(check)
            {
                progressBar.progress += quizBrain.incProgress()
                
                scoreLabel.text = quizBrain.updateScore(Answer: checkAnswer)
                
                sender.backgroundColor = UIColor.green
            }
            
            else
            {
                sender.backgroundColor = UIColor.red
            }
            
            if(quizBrain.getQuestionNumber()+1<quizBrain.questionCount())
            {
                quizBrain.incQuestionNumber()
                
                questionLabel.text = quizBrain.getQuestionText()
            }
            
            else if(quizBrain.getQuestionNumber()==(quizBrain.questionCount()-1))
            {
                quizBrain.incQuestionNumber()
            }
            
            Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(buttonReset), userInfo: nil, repeats: false)
        }
        
        if(quizBrain.getQuestionNumber()==quizBrain.questionCount())
        {
            questionLabel.text = "The quiz is over !!"
            
            trueButton.alpha = 0
            falseButton.backgroundColor = UIColor.clear
            
            falseButton.setTitle("Restart the quiz :-)", for: .normal)
            
            quizBrain.incQuestionNumber()
        }
        
        else if(quizBrain.getQuestionNumber() == (quizBrain.questionCount()+1) && sender.currentTitle == "Restart the quiz :-)")
        {
            quizBrain.resetQuestionNumber()
            
            progressBar.progress = 0.0
            trueButton.alpha = 1
            falseButton.setTitle("False", for: .normal)
            
            scoreLabel.text = "Score = 0"
            
            questionLabel.text = quizBrain.getQuestionText()
        }
    }
    
    @objc func buttonReset()
    {
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
    }

}

