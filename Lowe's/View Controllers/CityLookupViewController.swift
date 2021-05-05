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
        WeatherViewModel.fetchWeather(searchTerm: cityLookup) { [weak self]( result) in
            
            DispatchQueue.main.async {
                switch result {
                case .success(let result):
                    guard let vc = self?.storyboard?.instantiateViewController(identifier: "ConditionsVC") as? ConditionsViewController else {return}
                    vc.conditionsVM = ConditionsViewModel(weatherResponse: result)
                    self?.navigationController?.pushViewController(vc, animated: true)
                    print(result)
                case .failure(let error):
                    print(error, error.localizedDescription)
                }
            }
        }
        
    }
}
