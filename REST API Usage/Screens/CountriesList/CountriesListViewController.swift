//
//  CountriesListViewController.swift
//  REST API Usage
//
//  Created by Damian Markowski on 25.06.2017.
//  Copyright © 2017 Damian Markowski. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

class CountriesListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var countries: [CountryRequestResponse]!
    var selectedCountry: CountryRequestResponse!
    let cellXibName = "CountryTableViewCell"
    let cellIdentifier = "Cell"
    let requestURL = "https://restcountries.eu/rest/v2/all"
    let showCountryDetailsSegueIdentifier = "showCountryDetails"
    let screenTitle = "Choose country"
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = screenTitle
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countries = []
        configureTableView()
        fetchCountries()
    }
    
    fileprivate func configureTableView(){
        tableView.register(UINib(nibName: cellXibName, bundle: nil), forCellReuseIdentifier: cellIdentifier)
    }
    
    fileprivate func fetchCountries() {
        Alamofire.request(requestURL).responseArray { (response: DataResponse<[CountryRequestResponse]>) in
            self.countries = response.result.value
            self.tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == showCountryDetailsSegueIdentifier {
            
        }
    }
}

extension CountriesListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CountryTableViewCell
        cell.configure(countries[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedCountry = countries[indexPath.row]
        performSegue(withIdentifier: showCountryDetailsSegueIdentifier, sender: self)
    }
}
