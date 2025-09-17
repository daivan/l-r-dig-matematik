import SwiftUI

struct KeypadView: View {
    let keys: [String]          // Vilka knappar som ska visas
    var onKeyTap: (String) -> Void // Callback när man trycker

    var body: some View {
        LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 3), spacing: 15) {
            ForEach(keys, id: \.self) { key in
                Button(action: {
                    onKeyTap(key)
                }) {
                    Text(key)
                        .frame(width: 60, height: 60)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .font(.title)
                        .clipShape(Circle())
                }
            }
        }
        .padding()
    }
}
