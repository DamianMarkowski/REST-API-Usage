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
    var flagUrl: String!
    var coordinates: [Double]!
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        name <- map["name"]
        flagUrl <- map["flag"]
        coordinates <- map["latlng"]
    }
}
