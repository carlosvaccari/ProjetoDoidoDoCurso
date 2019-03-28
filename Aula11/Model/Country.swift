//
//  Country.swift
//  Aula11
//
//  Created by Virtual Machine on 28/03/19.
//  Copyright © 2019 Virtual Machine. All rights reserved.
//

import Foundation

struct Country {
    let countryImage : String?
    let countryName : String?
    let flag: Flag?
    
    init(json: [String: Any]) {
        
        countryImage = json["coverImage"] as? String ?? ""
        countryName = json["name"] as? String ?? ""
        flag = Flag(json: json["flag"] as? [String : Any] ?? [:])
    }
    
    static func getCountries(callback: @escaping (_ albums : [Country], _ error: Error?)->()) {
        
        API.getCountriesList.request { countriesJSON, error in
            
            let countries = countriesJSON.compactMap { countriesJSON in Country(json: countriesJSON) }
            callback(countries, error)
        }
    }
}

struct Flag {
    let url : String?
    
    init(json: [String : Any]) {
        
        url = json["url"] as? String ?? ""
    }
}
