//
//  CountriesListRouter.swift
//  REST API Usage
//
//  Created by Damian Markowski on 29.07.2018.
//  Copyright (c) 2018 Damian Markowski. All rights reserved.

import UIKit

protocol CountriesListRoutingLogic {
    func navigateToCountryDetailsScreen()
}

class CountriesListRouter: NSObject, CountriesListRoutingLogic {

    weak var viewController: CountriesListViewController?

    func navigateToCountryDetailsScreen() {
        viewController?.performSegue(withIdentifier: Constants.showCountryDetailsSegueIdentifier.rawValue, sender: nil)
    }
}
