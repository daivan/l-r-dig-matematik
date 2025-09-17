import Foundation

struct QuestionGenerator {
    
    static func generate(level: Int) -> Question {
        switch level {
        case 1:
            // Enkel addition, små tal
            let a = Int.random(in: 0...10)
            let b = Int.random(in: 0...10)
            return Question(
                text: "\(a) + \(b)",
                answer: String(a + b),
                type: .numeric
            )
            
        case 2:
            // Subtraktion
            let a = Int.random(in: 0...20)
            let b = Int.random(in: 0...a) // ingen negativt svar
            return Question(
                text: "\(a) - \(b)",
                answer: String(a - b),
                type: .numeric
            )
            
        case 3:
            // Multiplikation
            let a = Int.random(in: 0...10)
            let b = Int.random(in: 0...10)
            return Question(
                text: "\(a) × \(b)",
                answer: String(a * b),
                type: .numeric
            )
            
        case 4:
            // Division (heltal)
            let b = Int.random(in: 1...10)
            let result = Int.random(in: 1...10)
            let a = b * result
            return Question(
                text: "\(a) ÷ \(b)",
                answer: String(result),
                type: .numeric
            )
            
        default:
            // fallback – kan utvecklas till mer avancerat
            return Question(text: "1 + 1", answer: "2", type: .numeric)
        }
    }
}
