//
//  ViewController.swift
//  Quizzer
//
//  Created by ERNEST MURIUKI on 2/19/20.
//  Copyright © 2020 ERNEST MURIUKI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let allQuestions = QuestionBank()
    var pickedAnswer: Bool = false
    var questionNumber: Int = 0
    var userScore: Int = 0
    
//    let alertCorrect = UIAlertController(title: "Nice!", message: "You Got It Right!!!!", preferredStyle: .alert)
//    let alertWrong = UIAlertController(title: "Oooops!", message: "Wrong Answer :-( !!!", preferredStyle: .alert)
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let firstQuestion = allQuestions.list[questionNumber]
//        questionLabel.text = firstQuestion.questionText
//
//        progressLabel.text = "\(questionNumber + 1) / 12"
        
        startOver()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func answerSelected(_ sender: UIButton) {

        if (sender.tag == 1) {
            pickedAnswer = true
            print(pickedAnswer)
        }else{
            pickedAnswer = false
            print(pickedAnswer)
        }
        
        checkAnswer()
        questionNumber += 1
      
    }
    
    
    func checkAnswer(){
        
        let qsnAnswer = allQuestions.list[questionNumber].answer
       
        if (pickedAnswer == qsnAnswer) {
            
            userScore += 10
            
            let alertCorrect = UIAlertController(title: "Nice!", message: "You Got It Right!!!!", preferredStyle: .alert)
            let actionNext = UIAlertAction(title: "Next", style: .default) { (UIAlertAction) in
                self.nextQuestion()
            }
                       
            alertCorrect.addAction(actionNext)
            
            present(alertCorrect, animated: true, completion: nil)
            
         
        }else{
            print("Wrong")
            
            let alertWrong = UIAlertController(title: "Oooops!", message: "Wrong Answer :-( !!!", preferredStyle: .alert)
            let actionNext = UIAlertAction(title: "Next", style: .default) { (UIAlertAction) in
                self.nextQuestion()
            }
            
            alertWrong.addAction(actionNext)
            present(alertWrong, animated: true, completion: nil)
            
        }
        
        
    }
    
    func updateUI(){
        
        progressLabel.text = "\(questionNumber + 1) / 12"
        scoreLabel.text = "Score: \(userScore)"
        progressBar.frame.size.width = (view.frame.size.width / 12) * CGFloat(questionNumber + 1)
        
    }
    
    func nextQuestion(){
        
        if (questionNumber <= 11) {
            
           let nextQsn = allQuestions.list[questionNumber]
           questionLabel.text = nextQsn.questionText
           updateUI()
                   
       }else{

            let alert = UIAlertController(title: "Awesome", message: "Would you like to start over?", preferredStyle: .alert)
            
            let restartAction = UIAlertAction(title: "Restart", style: .default) { (UIAlertAction) in
                self.questionNumber = 0
                self.userScore = 0
                self.startOver()
            }
            
            let actionCancel = UIAlertAction(title: "Cancel", style: .cancel) { (UIAlertAction) in
                exit(-1)
            }
            
            alert.addAction(restartAction)
            alert.addAction(actionCancel)
            
            present(alert, animated: true, completion: nil)
            
       }
        
    }
    
    
    func startOver(){
        
        let firstQuestion = allQuestions.list[questionNumber]
              questionLabel.text = firstQuestion.questionText
              
              updateUI()
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return UIStatusBarStyle.lightContent
    }
    
}

