//
//  CountriesListPresenter.swift
//  REST API Usage
//
//  Created by Damian Markowski on 29.07.2018.
//  Copyright (c) 2018 Damian Markowski. All rights reserved.

import UIKit

protocol CountriesListPresentationLogic {
    func passCountries(countries: [Country])
}

class CountriesListPresenter: CountriesListPresentationLogic {

    weak var viewController: CountriesListDisplayLogic?

    func passCountries(countries: [Country]) {
        viewController?.displayCountries(countries: countries)
    }
}
