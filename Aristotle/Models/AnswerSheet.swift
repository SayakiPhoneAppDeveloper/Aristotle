//
//  AnswerSheet.swift
//  Aristotle
//
//  Created by Sayak Khatua on 09/01/21.
//


struct AnswerSheet: Identifiable {
    var id: String
    var answers: [Answer]?
}

struct Answer: Identifiable {
    var id: String
    var answerOption: Int = -1
}
