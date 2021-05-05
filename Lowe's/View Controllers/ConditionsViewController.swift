//
//  ConditionsViewController.swift
//  Lowe's
//
//  Created by Hin Wong on 4/30/21.
//

import UIKit

class ConditionsViewController: UIViewController {

    @IBOutlet weak var weatherConditionsTable: UITableView!
    
    var conditionsVM: ConditionsViewModel?
    var cellVM: WeatherTableViewCell?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherConditionsTable.dataSource = self
        weatherConditionsTable.delegate = self
        weatherConditionsTable.rowHeight = 100
        navigationController?.navigationBar.barTintColor = .purple
        //cellVM?.updateLabels(condition: <#String#>, temperature: <#Int#>)
    }


}

extension ConditionsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //print(conditionsVM?.getNumberOfTemperatures())
        return conditionsVM?.getNumberOfTemperatures() ?? 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = weatherConditionsTable.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath) as? WeatherTableViewCell else { return UITableViewCell() }
        let condition = conditionsVM?.getWeatherConditions(indexPath: indexPath)
        cell.updateLabels(condition: condition?.0 ?? "nil", temperature: condition?.1 ?? 0)
        //cell.viewModel = WeatherDetailsViewModel(weather: Weather?, city: City?, main: Main?)
        return cell
    }
}
