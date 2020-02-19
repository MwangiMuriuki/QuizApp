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

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func answerSelected(_ sender: UIButton) {

        print(sender.tag)
        
        if (sender.tag == 1) {
            pickedAnswer = true
        }else{
            pickedAnswer = false
        }
        
        checkAnswer()
        questionNumber += 1
        nextQuestion()
    }
    
    
    func updateUI(){
        
    }
    
    func nextQuestion(){
        
    }
    
    func checkAnswer(){
        
    }
    
    func startOver(){
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return UIStatusBarStyle.lightContent
    }
    
}

