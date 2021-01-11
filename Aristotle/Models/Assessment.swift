//
//  Assessment.swift
//  Aristotle
//
//  Created by Sayak Khatua on 06/01/21.
//

import RealmSwift
import Realm

@objcMembers class Assessment: Object, Decodable {
    dynamic var assessmentId: String?
    dynamic var assessmentName: String?
    dynamic var subject: String?
    dynamic var duration: Float64?
    dynamic var questions: List<Question> = List()
    
    enum CodingKeys: String, CodingKey {
        case assessmentId
        case assessmentName
        case subject
        case duration
        case questions
    }
    
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        assessmentId = try? container.decode(String.self, forKey: .assessmentId)
        assessmentName = try? container.decode(String.self, forKey: .assessmentName)
        subject = try? container.decode(String.self, forKey: .subject)
        duration = try? container.decode(Float64.self, forKey: .duration)
        let qs = try! container.decode(Array<Question>.self, forKey: .questions).filter({ (q) -> Bool in
            return q.type == "MC"
        })
        
        let result = List<Question>()
        for entry in qs {
            result.append(entry)
        }
        questions = result
    }
    
    required override init() {
        super.init()
    }
    override static func primaryKey() -> String?
        {
            return "assessmentId"
        }

}
