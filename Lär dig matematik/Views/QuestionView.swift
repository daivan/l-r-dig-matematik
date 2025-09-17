import SwiftUI

struct QuestionView: View {
    @StateObject private var viewModel: QuestionViewModel
    
    init(question: Question) {
        _viewModel = StateObject(wrappedValue: QuestionViewModel(question: question))
    }
    
    var body: some View {
        VStack(spacing: 20) {
            Text(viewModel.question.text)
                .font(.largeTitle)
            
            Text(viewModel.userAnswer)
                .font(.title)
                .padding()
            
            KeypadView(keys: viewModel.keysForType()) { key in
                viewModel.handleKeyTap(key)
            }
            
            Text(viewModel.feedback)
                .font(.headline)
        }
        .padding()
    }
}
