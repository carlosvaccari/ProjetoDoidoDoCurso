//
//  API.swift
//  Aula9-Demo
//
//  Created by Matheus on 2019-03-25.
//  Copyright © 2019 Mocka. All rights reserved.
//

import Foundation
import Alamofire

enum API {
    
    case getCountriesList
    case getPlayersBy(id: Int)
    case openPackage
}

extension API {
    
    struct Constants {
        static let baseURL: String = "http://104.236.64.79:1337/parse/"
    }
    
    var header: HTTPHeaders {
        var header: HTTPHeaders = [
            "X-Parse-Application-Id": "873db802f1b24a8e8837206806fff4c6",
            "Content-Type": "application/json"
        ]
        
        return header
    }
    
    var path: String {
        switch self {
        case .getCountriesList:
            return "classes/Team?order=name"
        case .getPlayersBy(let teamId):
            let data: [String: Any] = [
                "team": [
                    "__type": "Pointer",
                    "className": "Team",
                    "objectId": teamId
                ]
            ]
            return "classes/Player?include=team&where=\(data.convertToJson() ?? "")"
        case .openPackage:
            return "functions/openPackage"
        }
    }
    
    var url: String { return API.Constants.baseURL + path }
    
    var method: HTTPMethod {
        switch self {
            //        case .newPost:
        //            return .post
        default:
            return .get
        }
    }
    
    func request(params: [String: Any] = [:], callback: @escaping (_ data : [[String: Any]], _ error: Error?)->()) {
        
        let request = Alamofire.request(url, method: method, parameters: nil, encoding: JSONEncoding.prettyPrinted, headers: header)
        
        request.validate().responseJSON { response in
            print("STATUS CODE: \(response.response?.statusCode ?? 0)")
            switch response.result {
            case .success:
                if let json = response.result.value as? [[String: Any]] {
                    callback(json, response.error)
                } else {
                    callback([], response.error)
                }
            case .failure(let error):
                callback([], error)
            }
        }
    }
}
extension Dictionary {
    func convertToJson() -> String? {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: self,
                                                      options: JSONSerialization.WritingOptions(rawValue: 0))
            let jsonString = String(data: jsonData, encoding:
                String.Encoding.utf8)
            return jsonString
        } catch {
            print(error.localizedDescription)
        }
        
        return nil
    }
}
