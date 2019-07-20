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
    var countriesFetcher: CountriesFetcherType?

    func fetchCountries() {
        countriesFetcher?.fetchCountries(completion: { [weak self] countries in
            if let countries = countries {
                self?.presenter?.passCountries(countries: countries)
            }
        })
    }
}
