//
//  Players.swift
//  Aula11
//
//  Created by Virtual Machine on 29/03/19.
//  Copyright © 2019 Virtual Machine. All rights reserved.
//

import Foundation

struct Players {
    var age: Int?
    var name: String?
    
    init(json: [String: Any]) {
        
        age = json["age"] as? Int ?? 0
        name = json["name"] as? String ?? ""
    }
    
    static func getPlayers(id: String, callback: @escaping (_ players: [Players], _ error: Error?)->()) {
        
        API.getPlayersBy(id: id).request { playersJSON, error in
            
            let players = playersJSON.compactMap{ playersJSON in Players(json: playersJSON) }
            
            callback(players, error)
            
        }
        
    }
}

