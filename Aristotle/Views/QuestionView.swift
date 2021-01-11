//
//  QuestionView.swift
//  Aristotle
//
//  Created by Sayak Khatua on 09/01/21.
//

import SwiftUI

struct QuestionView: View {
    @ObservedObject var question = Question()
    
    var body: some View {
        VStack {
            Text(question.text ?? "Error")
                .font(.headline)
                .foregroundColor(.blue)
                .frame(width: 400, height: 50, alignment: .leading)
                .lineLimit(nil)
                .clipped()
                .padding()
            if let oprions = question.mcOptions {
                RadioButtonGroup(items: Array(oprions), selectedId: "London") { selected in
                    print("Selected is: \(selected)")
                }
            }
            
        }
    }
}

#if DEBUG
struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(question: Question())
    }
}
#endif
