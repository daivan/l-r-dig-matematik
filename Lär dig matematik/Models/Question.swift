enum QuestionType {
    case numeric    // vanliga siffror (0–9)
    case fraction   // bråk
    case algebra    // variabler & symboler
}

struct Question {
    let text: String
    let answer: String
    let type: QuestionType
}
