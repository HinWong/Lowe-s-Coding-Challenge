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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weatherConditionsTable.delegate = self
        weatherConditionsTable.rowHeight = 100
    }


}

extension ConditionsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        conditionsVM?.getNumberOfTemperatures() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = weatherConditionsTable.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath) as? WeatherTableViewCell else { return UITableViewCell() }
        return cell
    }
}
