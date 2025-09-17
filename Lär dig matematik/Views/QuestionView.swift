import SwiftUI

struct QuestionView: View {
    @StateObject private var viewModel = QuestionViewModel()
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Nivå \(viewModel.currentLevel + 1)")
                .font(.headline)
            
            Text(viewModel.currentQuestion.text)
                .font(.largeTitle)
                .multilineTextAlignment(.center)
                .padding()
            
            Text(viewModel.userAnswer)
                .font(.title)
                .padding()
            
            KeypadView(keys: viewModel.keysForType()) { key in
                viewModel.handleKeyTap(key)
            }
            
            Text(viewModel.feedback)
                .font(.headline)
                .foregroundColor(viewModel.feedback.contains("Rätt") ? .green : .red)
        }
        .padding()
    }
}
