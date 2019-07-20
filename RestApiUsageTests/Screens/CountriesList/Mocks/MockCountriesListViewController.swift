//
//  MockCountriesListViewController.swift
//  RestApiUsageTests
//
//  Created by Damian Markowski on 20/07/2019.
//  Copyright © 2019 Damian Markowski. All rights reserved.
//

import Foundation
@testable import RestApiUsage

class MockCountriesListViewController: CountriesListDisplayLogic {
    
    var displayCountriesCalled = false
    var spyCountries: [Country]?
    
    func displayCountries(countries: [Country]) {
        displayCountriesCalled = true
        spyCountries = countries
    }
    
    
}
