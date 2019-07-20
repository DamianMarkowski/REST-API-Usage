//
//  CountriesFetcher.swift
//  RestApiUsage
//
//  Created by Damian Markowski on 20/07/2019.
//  Copyright © 2019 Damian Markowski. All rights reserved.
//

import Foundation
import Alamofire

protocol CountriesFetcherType {
    func fetchCountries(completion: @escaping ([Country]?) -> Void)
}

class CountriesFetcher: CountriesFetcherType {

    private let requestURL = "https://restcountries.eu/rest/v2/all"
    
    func fetchCountries(completion: @escaping ([Country]?) -> Void) {
        Alamofire.request(requestURL).responseArray { [weak self] (response: DataResponse<[CountryRequestResponse]>) in
            if let countries = response.result.value {
                completion(self?.mapCountries(countries))
            } else {
                completion(nil)
            }
        }
    }
    
    private func mapCountries(_ countries: [CountryRequestResponse]) -> [Country] {
        var result = [Country]()
        for country in countries {
            result.append(Country(name: country.name, capitalCity: country.capitalCity, flagUrl: country.flagUrl, population: country.population, code: country.code))
        }
        return result
    }
}
