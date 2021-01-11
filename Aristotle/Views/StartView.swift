//
//  StartView.swift
//  Aristotle
//
//  Created by Sayak Khatua on 11/01/21.
//

import SwiftUI

struct StartView: View {
    @ObservedObject var viewModel = AssignmentViewModel()
    
    var startButton: some View {
        NavigationLink(destination: QuestionSheet(viewModel: viewModel, currentPageIndex: 0), isActive: .constant(true)) {
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Text("Start").foregroundColor(.white).fontWeight(.bold)
                    Spacer()
                }
                Spacer()
            }.frame(minHeight: 55.0, maxHeight: 55.0)
                .background(Color.orange)
                .cornerRadius(2.5)
                .padding(.top, 77.0)
            
        }.simultaneousGesture(TapGesture().onEnded{
            self.getAssessment()
        })
    }
    
    var titleView: some View {
        VStack(alignment: .leading) {
            Text("Welcome to")
                .tracking(1.0)
            Text("Digital Aristotle").fontWeight(.bold)
        }.padding(EdgeInsets(top: 44.0, leading: .zero, bottom: .zero, trailing: .zero))
    }
    
    var body: some View {
        NavigationView {
            LoadingView(isShowing: .constant(viewModel.isLoading)) {
                VStack(alignment: .leading) {
                    self.titleView
                    Spacer()
                    self.startButton
                    Spacer()
                }.padding(22.0)
            }
        }
    
    }
    
    private func getAssessment() {
        viewModel.getAssessment()
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView(viewModel: AssignmentViewModel())
    }
}

