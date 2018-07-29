//
//  CountriesListModels.swift
//  REST API Usage
//
//  Created by Damian Markowski on 29.07.2018.
//  Copyright (c) 2018 Damian Markowski. All rights reserved.

import UIKit
import ObjectMapper

class CountryRequestResponse: Mappable {
    var name: String!
    var capitalCity: String!
    var flagUrl: String!
    var population: Int?
    var code: String!

    required init?(map: Map) {

    }

    func mapping(map: Map) {
        name <- map["name"]
        capitalCity <- map["capital"]
        flagUrl <- map["flag"]
        population <- map["population"]
        code <- map["alpha3Code"]
    }
}
