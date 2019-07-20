//
//  CountriesListPresenterTests.swift
//  RestApiUsageTests
//
//  Created by Damian Markowski on 20/07/2019.
//  Copyright © 2019 Damian Markowski. All rights reserved.
//

import XCTest
@testable import RestApiUsage

class CountriesListPresenterTests: XCTestCase {

    var sut: CountriesListPresenter!
    var mockedViewController: MockCountriesListViewController!
    
    override func setUp() {
        super.setUp()
        sut = CountriesListPresenter()
        mockedViewController = MockCountriesListViewController()
        sut.viewController = mockedViewController
    }

    override func tearDown() {
        sut = nil
        mockedViewController = nil
        super.tearDown()
    }
    
    func test_passCountries_shouldCallDisplayCountriesFromViewControllerWithCorrectParameter() {
        let countries = [Country(name: "a", capitalCity: "b", flagUrl: "c", population: 2000, code: "e")]
        sut.passCountries(countries: countries)
        XCTAssert(mockedViewController.displayCountriesCalled)
        XCTAssertEqual(mockedViewController.spyCountries, countries)
    }

}
