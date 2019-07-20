//
//  CountriesListViewControllerTests.swift
//  RestApiUsageTests
//
//  Created by Damian Markowski on 20/07/2019.
//  Copyright © 2019 Damian Markowski. All rights reserved.
//

import XCTest
@testable import RestApiUsage

class CountriesListViewControllerTests: XCTestCase {

    var sut: CountriesListViewController!
    var mockedInteractor: MockCountriesListInteractor!
    var mockedRouter: MockCountriesListRouter!
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "CountriesList") as? CountriesListViewController else { return }
        sut = viewController
        mockedInteractor = MockCountriesListInteractor()
        mockedRouter = MockCountriesListRouter()
        sut.interactor = mockedInteractor
        sut.router = mockedRouter
        sut.loadViewIfNeeded()
    }

    override func tearDown() {
        sut = nil
        mockedInteractor = nil
        mockedRouter = nil
        super.tearDown()
    }
    
    func test_viewDidLoad_shouldCallFetchCountriesFromInteractor() {
        XCTAssert(mockedInteractor.fetchCountriesCalled)
    }
    
    func test_numberOfRowsInSection_shouldReturnNumberOfCountries() {
        let countries = [Country(name: "", capitalCity: "", flagUrl: "", population: nil, code: ""), Country(name: "", capitalCity: "", flagUrl: "", population: nil, code: "")]
        sut.displayCountries(countries: countries)
        XCTAssertEqual(sut.tableView(sut.tableView, numberOfRowsInSection: 0), countries.count)
    }
    
    func test_cellForRow_shouldReturnCountryTableViewCell() {
        let countries = [Country(name: "", capitalCity: "", flagUrl: "", population: nil, code: ""), Country(name: "", capitalCity: "", flagUrl: "", population: nil, code: "")]
        sut.displayCountries(countries: countries)
        XCTAssert(sut.tableView(sut.tableView, cellForRowAt: IndexPath(row: 0, section: 0)) is CountryTableViewCell)
    }
    
    func test_didSelectRow_shouldCallNavigateToCountryDetailsScreen() {
        let countries = [Country(name: "", capitalCity: "", flagUrl: "", population: nil, code: ""), Country(name: "", capitalCity: "", flagUrl: "", population: nil, code: "")]
        sut.displayCountries(countries: countries)
        sut.tableView(sut.tableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        XCTAssert(mockedRouter.navigateToCountryDetailsScreenCalled)
    }

}
