import SwiftUI

struct Question {
    let text: String
    let answer: Int
}

struct ContentView: View {
    @State private var question = Question(text: "2 + 2", answer: 4)
    @State private var userAnswer = ""
    @State private var feedback = ""

    var body: some View {
        VStack(spacing: 20) {
            Text("Lär dig matematik")
                .font(.largeTitle)
                .bold()

            Text(question.text)
                .font(.title)

            TextField("Ditt svar", text: $userAnswer)
                .keyboardType(.numberPad)
                .padding()
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
                .multilineTextAlignment(.center)

            Button("Kontrollera") {
                if Int(userAnswer) == question.answer {
                    feedback = "Rätt! 🎉"
                } else {
                    feedback = "Fel, försök igen."
                }
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
}
