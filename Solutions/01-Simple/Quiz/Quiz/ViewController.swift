// 
//  Copyright © 2020 Big Nerd Ranch
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var answerLabel: UILabel!
    
    let questions: [String] = [
        "What is 7+7?",
        "What is the capital of Vermont?",
        "What is cognac made from?"
    ]
    let answers: [String] = [
        "14",
        "Montpelier",
        "Grapes"
    ]
    
    var currentQuestionIndex: Int = 0
    
    @IBAction func showNextQuestion(_ sender: UIButton) {
        currentQuestionIndex += 1
        if currentQuestionIndex == questions.count {
            currentQuestionIndex = 0
        }
        let question = questions[currentQuestionIndex]
        questionLabel.text = question
        answerLabel.text = "???"
    }
    
    @IBAction func showAnswer(_ sender: UIButton) {
        let answer = answers[currentQuestionIndex]
        answerLabel.text = answer
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = questions[currentQuestionIndex]
    }


}

