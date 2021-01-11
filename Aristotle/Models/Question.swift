//
//  Question.swift
//  Aristotle
//
//  Created by Sayak Khatua on 06/01/21.
//

import RealmSwift
import Realm

@objcMembers class Question: Object, Decodable {
    dynamic var id: String?
    dynamic var qno: Int64?
    dynamic var text: String?
    dynamic var marks: Int16?
    dynamic var type: String?
    dynamic var mcOptions: List<String>?
    let assignment = LinkingObjects(fromType: Assessment.self, property: "questions")
    enum CodingKeys: String, CodingKey {
        case id
        case qno
        case text
        case marks
        case type
        case mcOptions
    }
    
    override init() {}
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try? container.decode(String.self, forKey: .id)
        qno = try? container.decode(Int64.self, forKey: .qno)
        text = try? container.decode(String.self, forKey: .text)
        marks = try? container.decode(Int16.self, forKey: .marks)
        type = try? container.decode(String.self, forKey: .type)
        mcOptions = try? container.decode(List<String>.self, forKey: .mcOptions)
    }
    override static func primaryKey() -> String?
        {
            return "id"
        }
}
