//
//  MockCountriesListRouter.swift
//  RestApiUsageTests
//
//  Created by Damian Markowski on 20/07/2019.
//  Copyright © 2019 Damian Markowski. All rights reserved.
//

import Foundation
@testable import RestApiUsage

class MockCountriesListRouter: CountriesListRoutingLogic {
    
    var navigateToCountryDetailsScreenCalled = false
    
    func navigateToCountryDetailsScreen() {
        navigateToCountryDetailsScreenCalled = true
    }
    
}
