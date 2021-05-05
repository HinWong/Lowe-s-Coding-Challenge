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
    
    var viewModel: WeatherDetailsViewModel? {
        didSet {
            weatherTemperatureLabel.text = "\(String(describing: (viewModel?.temperature())))"
            weatherConditionsLabel.text = "\(String(describing: viewModel?.weatherType()))"
//                print(viewModel?.temperature())
//                print(viewModel?.weatherDescrption())
        }
    }

    
    
    func updateLabels(condition: String, temperature: Int) {
        weatherConditionsLabel.text = condition
        weatherTemperatureLabel.text = "temp:\(temperature)"

        

    }
    


}
