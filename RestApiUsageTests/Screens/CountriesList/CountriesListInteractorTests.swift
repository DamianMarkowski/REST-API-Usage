//
//  CountriesListInteractorTests.swift
//  RestApiUsageTests
//
//  Created by Damian Markowski on 20/07/2019.
//  Copyright © 2019 Damian Markowski. All rights reserved.
//

import XCTest
@testable import RestApiUsage

class CountriesListInteractorTests: XCTestCase {

    var sut: CountriesListInteractor!
    var mockedCountriesFetcher: MockCountriesFetcher!
    var mockedPresenter: MockCountriesListPresenter!
    
    override func setUp() {
        super.setUp()
        sut = CountriesListInteractor()
        mockedCountriesFetcher = MockCountriesFetcher()
        mockedPresenter = MockCountriesListPresenter()
        sut.countriesFetcher = mockedCountriesFetcher
        sut.presenter = mockedPresenter
    }

    override func tearDown() {
        sut = nil
        mockedCountriesFetcher = nil
        mockedPresenter = nil
        super.tearDown()
    }
    
    func test_fetchCountries_shouldCallFetchCountriesFromCountriesFetcher() {
        sut.fetchCountries()
        XCTAssert(mockedCountriesFetcher.fetchCountriesCalled)
    }
    
    func test_fetchCountries_shouldCallPassCountriesFromPresenterWithCorrectParameter_whenAtLeastOneCountryFound() {
        let countries = [Country(name: "", capitalCity: "", flagUrl: "", population: nil, code: "")]
        mockedCountriesFetcher.stubCountries = countries
        sut.fetchCountries()
        XCTAssert(mockedPresenter.passCountriesCalled)
        XCTAssertEqual(mockedPresenter.spyCountries, countries)
    }
    
    func test_fetchCountries_shouldNotCallPassCountriesFromPresenter_whenNoCountriesFound() {
        sut.fetchCountries()
        XCTAssertFalse(mockedPresenter.passCountriesCalled)
    }

}
