//
//  AssignmentViewModel.swift
//  Aristotle
//
//  Created by Sayak Khatua on 10/01/21.
//

import Combine
import Alamofire
import RealmSwift
import Realm
import SwiftUI

class AssignmentViewModel: APIHandler, ObservableObject, Identifiable {
    @Published var assessmentResponse: Assessment?
    @Published var questionViews: [UIHostingController<QuestionView>]?
    @Published var isLoading = false
    
    func getAssessment() {
        isLoading = true
        
        let url = "https://assessed-da.s3-ap-southeast-1.amazonaws.com/exam/exam.json"
        
        AF.request(url, method: .get).responseDecodable { [weak self] (response: DataResponse<Assessment, AFError>) in
            guard let weakSelf = self else { return }
            
            guard let response = weakSelf.handleResponse(response) as? Assessment else {
                weakSelf.isLoading = false
                return
            }
            
            weakSelf.isLoading = false
            weakSelf.assessmentResponse = response
            
            weakSelf.questionViews = weakSelf.getQuestionViews(assignment: response)
            
            let realm = try! Realm()
            realm.beginWrite()
            realm.add(response, update: Realm.UpdatePolicy.modified)
            if realm.isInWriteTransaction {
                try! realm.commitWrite()
            }
        }
    }
    
    func getQuestionViews(assignment: Assessment?) -> [UIHostingController<QuestionView>]? {
        var hostings: [UIHostingController<QuestionView>]?
        if let questions = assignment?.questions {
            let qarray = Array(questions)
            if qarray.count>0 {
                hostings = []
                for question in qarray {
                    let qView = UIHostingController(rootView: QuestionView(question: question))
                    hostings?.append(qView)
                }
            }
        }
        
        return hostings
    }
}
