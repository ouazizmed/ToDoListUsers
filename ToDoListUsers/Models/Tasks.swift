//
//  Tasks.swift
//  ToDoListUsers
//
//  Created by Mac on 22/04/2022.
//

import Foundation

struct Tasks: Codable {

    var userID: Int
    var id: Int
    var title: String
    var completed: Bool
    
    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id = "id"
        case title = "title"
        case completed = "completed"
    }
    
    init(from decoder: Decoder) throws {
        let taskContainer = try decoder.container(keyedBy: CodingKeys.self)
        
        userID = try taskContainer.decode(Int.self, forKey: .userID)
        id = try taskContainer.decode(Int.self, forKey: .id)
        title = try taskContainer.decode(String.self, forKey: .title)
        completed = try taskContainer.decode(Bool.self, forKey: .completed)
    }
}
