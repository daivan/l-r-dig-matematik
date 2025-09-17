let level1Questions: [Question] = [
    Question(text: "1 + 1", answer: "2", type: .numeric),
    Question(text: "3 - 2", answer: "1", type: .numeric),
    Question(text: "4 / 2", answer: "2", type: .numeric)
]

let level2Questions: [Question] = [
    Question(text: "10 - 5", answer: "5", type: .numeric),
    Question(text: "6 + 7", answer: "13", type: .numeric),
    Question(text: "12 / 3", answer: "4", type: .numeric)
]

let level3Questions: [Question] = [
    Question(text: "Vilket är hälften av 1?", answer: "½", type: .fraction),
    Question(text: "Vilket är tre fjärdedelar?", answer: "¾", type: .fraction)
]

let allLevels: [[Question]] = [
    level1Questions,
    level2Questions,
    level3Questions
]
