//
//  CountriesListInteractor.swift
//  REST API Usage
//
//  Created by Damian Markowski on 29.07.2018.
//  Copyright (c) 2018 Damian Markowski. All rights reserved.

import Alamofire
import AlamofireObjectMapper

protocol CountriesListBusinessLogic {
    func fetchCountries()
}

class CountriesListInteractor: CountriesListBusinessLogic {

    var presenter: CountriesListPresentationLogic?
    private let requestURL = "https://restcountries.eu/rest/v2/all"

    func fetchCountries() {
        Alamofire.request(requestURL).responseArray {[weak self] (response: DataResponse<[CountryRequestResponse]>) in
            if let countries = response.result.value {
                self?.presenter?.passCountries(countries: countries)
            }
        }
    }
}
