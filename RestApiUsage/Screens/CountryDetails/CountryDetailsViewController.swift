//
//  CountryDetailsViewController.swift
//  REST API Usage
//
//  Created by Damian Markowski on 25.06.2017.
//  Copyright © 2017 Damian Markowski. All rights reserved.
//

import UIKit

class CountryDetailsViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var capitalLabel: UILabel!
    @IBOutlet weak var populationLabel: UILabel!
    @IBOutlet weak var codeLabel: UILabel!
    let screenTitle = "Country details"
    var selectedCountry: Country!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = screenTitle
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        populateData()
    }

    fileprivate func populateData() {
        nameLabel.text = selectedCountry.name
        capitalLabel.text = selectedCountry.capitalCity
        if let population = selectedCountry.population {
            populationLabel.text = String(describing: population)
        }
        codeLabel.text = selectedCountry.code
    }
}
