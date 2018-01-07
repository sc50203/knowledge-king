//
//  ViewController.swift
//  knowledge king
//
//  Created by leeal on 2018/1/7.
//  Copyright © 2018年 Aptan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressLable: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressBar: UIImageView!
    let allQuestion = QuestionBank()
    var pickAnswer = false
    var questionNum = 0
    var score = 0

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
         questionLabel.text = allQuestion.list[questionNum].question
        //將questionLabel帶入question，且會等於QuestionBank中的list
        UpdateUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonPress(_ sender: UIButton) {
        //為按鈕命名意義，若選了1，及選了正確的，反之
        if(sender.tag == 1){
            pickAnswer = true
        }
        else if(sender.tag == 2){
            pickAnswer = false
        }
        checkAnswer()
        questionNum = questionNum + 1
        nextQuestion()
    }
    
    func UpdateUI(){
        scoreLabel.text = "\(score)"
        progressLable.text = "\(questionNum + 1)/3"
        progressBar.frame.size.width = (view.frame.size.width / 3) * CGFloat(questionNum + 1)
    }
    
    func nextQuestion(){
        if(questionNum <= 2) {
            questionLabel.text = allQuestion.list[questionNum].question
            UpdateUI()
        }
        else {
            let alert = UIAlertController(title: "Very Good", message: "You've completed it. Try Again?", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler: { (UIAlerAction) in self.startOver()
            })
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
            
        
         
        
        }
    }
    
    func startOver() {
        score = 0
        questionNum = 0
        questionLabel.text = allQuestion.list[questionNum].question
        UpdateUI()
    }
    
    func checkAnswer(){
        if (allQuestion.list[questionNum].answer == pickAnswer){
            score = score + 1
            ProgressHUD.showSuccess("Correct")
        }
        else{
            print("wrong")
            ProgressHUD.showSuccess("Incorrect")
        }
    }
    
    
}

