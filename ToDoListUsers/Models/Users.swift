//
//  Users.swift
//  ToDoListUsers
//
//  Created by Mac on 22/04/2022.
//

import Foundation

struct Users: Codable {

    var id: Int
    var name: String
    var username: String
    var email: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case username = "username"
        case email = "email"
    }
    
    init(from decoder: Decoder) throws {
        let userContainer = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try userContainer.decode(Int.self, forKey: .id)
        name = try userContainer.decode(String.self, forKey: .name)
        username = try userContainer.decode(String.self, forKey: .username)
        email = try userContainer.decode(String.self, forKey: .email)
    }
}


