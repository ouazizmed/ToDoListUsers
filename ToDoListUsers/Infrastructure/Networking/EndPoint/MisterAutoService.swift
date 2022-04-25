//
//  MisterAutoService.swift
//  ToDoListUsers
//
//  Created by Mac on 22/04/2022.
//

import Foundation

public enum MisterAutoApi {
    case getUser
    case getTask(id_user: Int)
}

extension MisterAutoApi: EndPointType {
    
    var environmentBaseURL : String {
        get { "https://jsonplaceholder.typicode.com/" }
    }
       
    var baseURL: URL {
        guard let url = URL(string: environmentBaseURL) else { fatalError("baseURL could not be configured.")}
        return url
    }
    
    var path: String {
        switch self {
        case .getUser:
            return "users"
        case .getTask:
            return "todos"
        }
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var task: HTTPTask {
        switch self {
        case .getUser:
            return .request
        case .getTask(let id_user):
            return .requestParameters(bodyParameters: nil,
                                      bodyEncoding: .urlEncoding,
                                      urlParameters: ["userId": id_user])
        }
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
    
}
