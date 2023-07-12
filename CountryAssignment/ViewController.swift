//
//  ViewController.swift
//  CountryAssignment
//
//  Created by Oladapo Olatubosun on 08/07/2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var countryTableView : UITableView!
    
    var cities = ["Lagos","Tokyo", "Delhi", "Shanghai", "São Paulo", "Dhaka",
                  "Osaka", "Mumbai", "Cairo", "Mexico City"]
    
    var cityCountry : [String:String] = ["Lagos": "Nigeria","Tokyo":"Japan","Delhi": "India", "Shanghai":"China", "São Paulo" :"Brazil", "Dhaka":"Bangladesh", "Osaka": "Japan", "Mumbai":"India",  "Cairo": "Egypt", "Mexico City":"Mexico"  ]
    
    struct Constants{
        static let cellIdentifier = "CityCountryCell"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        countryTableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.cellIdentifier)
    }


}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath)
        
        var cellContentConfiguration = tableViewCell.defaultContentConfiguration()
        let cityName = cities[indexPath.row]
        cellContentConfiguration.text = cityName
        cellContentConfiguration.secondaryText = cityCountry[cityName] ?? ""
        
        tableViewCell.contentConfiguration = cellContentConfiguration
        
        return tableViewCell
    }
}

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cityName = cities[indexPath.row]
        let countryName = cityCountry[cityName]
        print("City: \(cityName), Country: \(countryName ?? "")")
        tableView.deselectRow(at: indexPath, animated: true) //to prevent selection color
    }
}
