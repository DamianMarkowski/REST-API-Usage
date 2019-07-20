//
//  MockCountriesListPresenter.swift
//  RestApiUsageTests
//
//  Created by Damian Markowski on 20/07/2019.
//  Copyright © 2019 Damian Markowski. All rights reserved.
//

import Foundation
@testable import RestApiUsage

class MockCountriesListPresenter: CountriesListPresentationLogic {
    
    var passCountriesCalled = false
    
    func passCountries(countries: [Country]) {
        passCountriesCalled = true
    }
    
}
