import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Lär dig matematik")
                    .font(.largeTitle)
                    .bold()
                
                NavigationLink("Börja träna") {
                    QuestionView(question: level1Questions[0]) // 👈 skickar in första frågan
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
            .navigationTitle("Start")
        }
    }
}
