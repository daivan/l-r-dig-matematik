import SwiftUI

class QuestionViewModel: ObservableObject {
    @Published var currentQuestion: Question
    @Published var userAnswer: String = ""
    @Published var score: Int = 0
    @Published var level: Int = 1
    @Published var feedback: String = ""   // 👈 viktig
    
    var keysForType: [String] {
        switch currentQuestion.type {
        case .numeric:
            return (0...9).map { String($0) } + ["⌫"]
        case .custom(let values):
            return values
        case .fraction:
            return (0...9).map { String($0) } + ["⌫"]
        case .algebra:
            return (0...9).map { String($0) } + ["⌫"]
        }
        
    }
    
    
    init() {
        self.currentQuestion = QuestionGenerator.generate(level: 1)
    }
    
    func submitAnswer() {
        if userAnswer == currentQuestion.answer {
            feedback = "Rätt! 🎉"
            score += 1
            if score % 5 == 0 {
                level += 1
            }
            currentQuestion = QuestionGenerator.generate(level: level) // 👈 byter fråga direkt
        } else {
            feedback = "Fel, försök igen 😅"
        }
        userAnswer = ""
    }
    
    func handleKeyPress(_ key: String) {
        switch key {
        case "⌫":
            if !userAnswer.isEmpty {
                userAnswer.removeLast()
            }
        default:
            userAnswer.append(key)
        }
    }
}
