
import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var labelScore: UILabel!
    @IBOutlet weak var labelQuestion: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var buttonOutletFalse: UIButton!
    @IBOutlet weak var buttonOutletTrue: UIButton!
    @IBOutlet weak var buttonOutletNotr: UIButton!
    var quizBrain = Brain()
    var count = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        progressBar.progress = 0
        labelQuestion.text = quizBrain.getQuestions()
        buttonOutletTrue.layer.cornerRadius = 40
        buttonOutletFalse.layer.cornerRadius = 40
        buttonOutletNotr.layer.cornerRadius = 40
        changeButton()
        
    }
    @IBAction func buttonClicked(_ sender: UIButton) {
        
        progressBar.progress = quizBrain.getProgress()
        let userAnswer = sender.currentTitle!
        if userAnswer == "xiaomi" {
            quizBrain.addAlert(vc: self)
        }
        else{
            let userSection = quizBrain.checkAnswer(userAnswer)
            
            if  userSection {
                getColor(button: sender, color: .systemGreen)
            }
            else {
                getColor(button: sender, color: .systemRed)
            }
        }
    }
    
    func getColor(button: UIButton,color: UIColor){
        button.backgroundColor = color
        button.setTitleColor(.black, for: .normal)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            button.backgroundColor = #colorLiteral(red: 0.3012520671, green: 0.3262906373, blue: 0.5364041328, alpha: 1)
            button.setTitleColor(.white, for: .normal)
        }
        quizBrain.nextQuestion()
        quizBrain.getScore()
        quizBrain.getAnswer()
        labelScore.text = "SCORE: \(quizBrain.getScore())"
        labelQuestion.text = quizBrain.getQuestions()
        changeButton()
    }
    func changeButton(){
        
        buttonOutletTrue.setTitle(quizBrain.getAnswer()[0], for: .normal)
        buttonOutletNotr.setTitle(quizBrain.getAnswer()[1], for: .normal)
        buttonOutletFalse.setTitle(quizBrain.getAnswer()[2], for: .normal)
    }
}

