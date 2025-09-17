import SwiftUI

class QuestionViewModel: ObservableObject {
    @Published var userAnswer = ""
    @Published var feedback = ""
    @Published var currentLevel = 0
    @Published var currentQuestionIndex = 0
    
    var currentQuestion: Question {
        allLevels[currentLevel][currentQuestionIndex]
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
        if userAnswer == currentQuestion.answer {
            feedback = "Rätt! 🎉"
            goToNextQuestion()
        } else {
            feedback = "Fel, försök igen."
        }
        userAnswer = ""
    }
    
    private func goToNextQuestion() {
        let questions = allLevels[currentLevel]
        if currentQuestionIndex < questions.count - 1 {
            currentQuestionIndex += 1
        } else {
            // Klarade hela nivån
            if currentLevel < allLevels.count - 1 {
                currentLevel += 1
                currentQuestionIndex = 0
                feedback = "Bra jobbat! Nu nivå \(currentLevel + 1) 👉"
            } else {
                feedback = "Du har klarat alla nivåer! 🎉🎉🎉"
            }
        }
    }
    
    func keysForType() -> [String] {
        switch currentQuestion.type {
        case .numeric:
            return ["1","2","3","4","5","6","7","8","9","0","⌫","OK"]
        case .fraction:
            return ["½","⅓","¼","¾","2/3","⌫","OK"]
        case .algebra:
            return ["x","y","=","1","2","3","4","5","⌫","OK"]
        }
    }
}
