//
//  CountryTableViewCell.swift
//  REST API Usage
//
//  Created by Damian Markowski on 25.06.2017.
//  Copyright © 2017 Damian Markowski. All rights reserved.
//

import UIKit

class CountryTableViewCell: UITableViewCell {

    @IBOutlet weak var countryNameLabel: UILabel!
    var requestResponse: CountryRequestResponse!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

    func configure(_ data: CountryRequestResponse) {
        requestResponse = data
        populateData()
    }

    fileprivate func populateData() {
        countryNameLabel.text = requestResponse.name
        // TBD: populating UIImage with svg flag image 
    }
}
