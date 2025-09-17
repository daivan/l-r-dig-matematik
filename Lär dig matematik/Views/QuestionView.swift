import SwiftUI
struct QuestionView: View {
    @StateObject private var viewModel = QuestionViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Nivå \(viewModel.level)")
                .font(.headline)
            
            Text(viewModel.currentQuestion.text)
                .font(.largeTitle)
                .padding()
            
            Text(viewModel.userAnswer)
                .font(.title)
                .padding()
            
            KeypadView(keys: viewModel.keysForType) { key in
                viewModel.handleKeyPress(key)
            }
            
            Button("Svara") {
                viewModel.submitAnswer()
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            
            Text(viewModel.feedback)
                .font(.headline)
                .foregroundColor(viewModel.feedback.contains("Rätt") ? .green : .red)
        }
        .padding()
    }
}
