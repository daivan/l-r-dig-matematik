import SwiftUI

class QuestionViewModel: ObservableObject {
    @Published var userAnswer = ""
    @Published var feedback = ""
    
    var question: Question
    
    init(question: Question) {
        self.question = question
    }
    
    func handleKeyTap(_ key: String) {
        switch key {
        case "⌫":
            if !userAnswer.isEmpty {
                userAnswer.removeLast()
            }
        case "OK":
            checkAnswer()
        default:
            userAnswer.append(key)
        }
    }
    
    private func checkAnswer() {
        if userAnswer == question.answer {
            feedback = "Rätt! 🎉"
        } else {
            feedback = "Fel, försök igen."
        }
        userAnswer = ""
    }
    
    func keysForType() -> [String] {
        switch question.type {
        case .numeric:
            return ["1","2","3","4","5","6","7","8","9","0","⌫","OK"]
        case .fraction:
            return ["½","⅓","¼","¾","2/3","⌫","OK"]
        case .algebra:
            return ["x","y","=","1","2","3","4","5","⌫","OK"]
        }
    }
}
