//
//  CountriesListViewController.swift
//  REST API Usage
//
//  Created by Damian Markowski on 29.07.2018.
//  Copyright (c) 2018 Damian Markowski. All rights reserved.

import UIKit

protocol CountriesListDisplayLogic: class {
    func displayCountries(countries: [CountryRequestResponse])
}

class CountriesListViewController: UIViewController, CountriesListDisplayLogic {

    var interactor: CountriesListBusinessLogic?
    var router: (NSObjectProtocol & CountriesListRoutingLogic)?
    @IBOutlet weak var tableView: UITableView!
    var countries: [CountryRequestResponse] = []
    var selectedCountry: CountryRequestResponse!
    let cellIdentifier = "Cell"
    private let cellXibName = "CountryTableViewCell"
    private let screenTitle = "Choose country"

    // MARK: Object lifecycle

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    // MARK: Setup

    private func setup() {
        let viewController = self
        let interactor = CountriesListInteractor()
        let presenter = CountriesListPresenter()
        let router = CountriesListRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
    }

    // MARK: View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setScreenTitle()
        configureTableView()
        interactor?.fetchCountries()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let showCountrySegueId = Constants.showCountryDetailsSegueIdentifier.rawValue
        if segue.identifier == showCountrySegueId {
            if let viewController = segue.destination as? CountryDetailsViewController {
                viewController.selectedCountry = selectedCountry
            }
        }
    }

    // MARK: Private methods

    private func setScreenTitle() {
        title = screenTitle
    }

    private func configureTableView() {
        tableView.register(UINib(nibName: cellXibName, bundle: nil), forCellReuseIdentifier: cellIdentifier)
    }

    // MARK: Public methods

    func displayCountries(countries: [CountryRequestResponse]) {
        self.countries = countries
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

}

extension CountriesListViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let countryCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier,
                                                        for: indexPath) as? CountryTableViewCell
        guard let cell = countryCell else { return UITableViewCell() }
        cell.configure(countries[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedCountry = countries[indexPath.row]
        router?.navigateToCountryDetailsScreen()
    }
}
