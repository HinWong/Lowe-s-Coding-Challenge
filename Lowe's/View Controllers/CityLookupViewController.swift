//
//  CityLookupViewController.swift
//  Lowe's
//
//  Created by Hin Wong on 4/30/21.
//

import UIKit

class CityLookupViewController: UIViewController {
    
    let cityLookupVM = WeatherViewModel()
    
    @IBOutlet weak var cityNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func lookupButton(_ sender: UIButton) {
        guard let cityLookup = cityNameTextField.text, !cityLookup.isEmpty else { return }
        WeatherViewModel.fetchWeather(searchTerm: cityLookup) {_ in
            guard self != nil else {return}
            
        }
        
    }
}
