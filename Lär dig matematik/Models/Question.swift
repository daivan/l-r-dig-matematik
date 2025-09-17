enum QuestionType {
    case numeric    // vanliga siffror (0–9)
    case fraction   // bråk
    case algebra    // variabler & symboler
    case custom([String]) // 👈 här kan vi skicka in egna tangenter
}

struct Question {
    let text: String
    let answer: String
    let type: QuestionType
}
