//
//  WeatherTableViewCell.swift
//  Lowe's
//
//  Created by Hin Wong on 4/30/21.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {

    @IBOutlet weak var weatherConditionsLabel: UILabel!
    @IBOutlet weak var weatherTemperatureLabel: UILabel!
    
    func updateLabels() {
        var viewModel: WeatherDetailsViewModel? {
            didSet {
                weatherTemperatureLabel.text = String(viewModel?.temperature())
                weatherConditionsLabel.text = viewModel?.weatherDescrption()
            }
        }

    }
    


}
