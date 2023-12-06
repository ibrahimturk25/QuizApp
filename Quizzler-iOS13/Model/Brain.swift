
import Foundation
import UIKit
struct Brain{
    var count = 0
    var score = 0
    var array = [
        Data(questions: "2 + 4 ", answer: ["3","6","12"],bool: "6"),
        Data(questions: "5 + 6 ", answer: ["15","11","20"],bool: "11"),
        Data(questions: "12 + 21 ", answer: ["33","25","20"],bool: "33"),
        Data(questions: "42 + 23 ", answer: ["55","68","65"],bool: "65"),
        Data(questions: "25 + 15 ", answer: ["30","40","50"],bool: "40"),
        Data(questions: "77 + 33 ", answer: ["100","120","110"],bool: "110"),
        Data(questions: "15 x 15", answer: ["625","225","425"],bool: "225"),
        Data(questions: "Türkiye'nin En Kalabalık Sehri ", answer: ["Ankara","Antalya","Istanbul"],bool: "Istanbul"),
        Data(questions: "973 / 33", answer: ["1000","900","1100"],bool: "1100"),
        Data(questions: "En Güzel Şehir", answer: ["Erzurum","Samsun","New York"],bool: "Erzurum")
    ]
    
    mutating func  checkAnswer(_ userAnswer: String) -> Bool{
        if userAnswer == array[count].bool{
            score += 1
            return true
        } else{
            return false
        }
    }
    
    func getQuestions() -> String{
        return array[count].questions
        
    }
    func getAnswer() -> [String]{
        return  array[count].answer
    }
    
    func getProgress() -> Float{
        return Float(count + 1) / Float(array.count)
    }
    func getScore() -> Int{
        return score
    }
    func addAlert(vc: ViewController){
        let alert = UIAlertController(title: "Aynen Kardeşim Xiaomi", message: "Başka birtane seç", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okButton)
        vc.present(alert,animated: true)
        
    }
    
    mutating func nextQuestion(){
        if array.count > count + 1{
            count += 1
        }else{
            score = 0
            count = 0
            
        }
    }
}
