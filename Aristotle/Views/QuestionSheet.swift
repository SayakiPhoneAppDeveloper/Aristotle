//
//  QuestionSheet.swift
//  Aristotle
//
//  Created by Sayak Khatua on 09/01/21.
//

import SwiftUI

struct QuestionSheet: View {
    @ObservedObject var viewModel = AssignmentViewModel()
    
    @State var currentPageIndex = 0
    
    var finishButton: some View {
        NavigationLink(destination: QuestionSheet(viewModel: viewModel, currentPageIndex: 0), isActive: .constant($viewModel.assessmentResponse != nil)) {
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Text("Finish").foregroundColor(.white).fontWeight(.bold)
                    Spacer()
                }
                Spacer()
            }.frame(minHeight: 55.0, maxHeight: 55.0)
                .background(Color.orange)
                .cornerRadius(2.5)
                .padding(.top, 77.0)
            
        }.simultaneousGesture(TapGesture().onEnded{
            //Finisher
        })
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            PageViewController(currentPageIndex: $currentPageIndex, viewControllers: viewModel.questionViews ?? [])
                .frame(height: 600)
            
                .padding()
            HStack {
                PageControl(numberOfPages: (viewModel.questionViews ?? []).count, currentPageIndex: $currentPageIndex)
                
                Spacer()
                Button(action: {
                    if self.currentPageIndex-1 == -1 {
                        self.currentPageIndex = (viewModel.questionViews ?? []).count - 1
                    } else {
                        self.currentPageIndex -= 1
                    }
                }) {
                    ButtonContentLeft()
                }
                                
                Spacer()
                Button(action: {
                    if self.currentPageIndex+1 == (viewModel.questionViews ?? []).count {
                        self.currentPageIndex = 0
                    } else {
                        self.currentPageIndex += 1
                    }
                }) {
                    ButtonContentRight()
                }
            }
                .padding()
            self.finishButton
        }
    }
}

struct ButtonContentRight: View {
    var body: some View {
        Image(systemName: "arrow.right")
        .resizable()
        .foregroundColor(.white)
        .frame(width: 30, height: 30)
        .padding()
        .background(Color.orange)
        .cornerRadius(30)
    }
}
struct ButtonContentLeft: View {
    var body: some View {
        Image(systemName: "arrow.left")
        .resizable()
        .foregroundColor(.white)
        .frame(width: 30, height: 30)
        .padding()
        .background(Color.orange)
        .cornerRadius(30)
    }
}

#if DEBUG
struct QuestionSheet_Previews: PreviewProvider {
    static var previews: some View {
        QuestionSheet(viewModel: AssignmentViewModel(), currentPageIndex: 0)
    }
}
#endif
