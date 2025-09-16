import SwiftUI

struct Question {
    let text: String
    let answer: Int
}

let level1Questions: [Question] = [
    Question(text: "1 + 1", answer: 2),
    Question(text: "2 + 3", answer: 5),
    Question(text: "5 - 2", answer: 3)
]

let level2Questions: [Question] = [
    Question(text: "10 / 2", answer: 5),
    Question(text: "3 x 4", answer: 12),
    Question(text: "15 - 7", answer: 8)
]

struct ContentView: View {
    @State private var currentLevel = 1
    @State private var currentQuestionIndex = 0
    @State private var userAnswer = ""
    @State private var feedback = ""
    
    var questions: [Question] {
        if currentLevel == 1 {
            return level1Questions
        } else {
            return level2Questions
        }
    }
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Nivå \(currentLevel)")
                .font(.headline)
            
            Text(questions[currentQuestionIndex].text)
                .font(.largeTitle)
            
            TextField("Ditt svar", text: $userAnswer)
                .keyboardType(.numberPad)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
                .multilineTextAlignment(.center)
            
            Button("Kontrollera") {
                checkAnswer()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
            
            Text(feedback)
                .font(.headline)
                .foregroundColor(feedback.contains("Rätt") ? .green : .red)
        }
        .padding()
    }
    
    func checkAnswer() {
        guard let intAnswer = Int(userAnswer) else {
            feedback = "Skriv ett tal!"
            return
        }
        
        if intAnswer == questions[currentQuestionIndex].answer {
            feedback = "Rätt! 🎉"
            goToNextQuestion()
        } else {
            feedback = "Fel, försök igen."
        }
        
        userAnswer = ""
    }
    
    func goToNextQuestion() {
        if currentQuestionIndex < questions.count - 1 {
            currentQuestionIndex += 1
        } else {
            // Gå upp en nivå om det finns fler
            currentLevel += 1
            currentQuestionIndex = 0
        }
    }
}
