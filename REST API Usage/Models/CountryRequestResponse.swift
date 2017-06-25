//
//  CountryRequestResponse.swift
//  REST API Usage
//
//  Created by Damian Markowski on 25.06.2017.
//  Copyright © 2017 Damian Markowski. All rights reserved.
//

import Foundation

import ObjectMapper

class CountryRequestResponse: Mappable {
    var name: String!
    var capitalCity: String!
    var flagUrl: String!
    var population: Int?
    var code: String!
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        name <- map["name"]
        capitalCity <- map["capital"]
        flagUrl <- map["flag"]
        population <- map["population"]
        code <- map["alpha3Code"]
    }
}
