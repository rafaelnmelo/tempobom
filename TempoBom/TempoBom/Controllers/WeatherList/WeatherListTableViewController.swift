import UIKit

class WeatherListTableViewController: UITableViewController {

    private var weatherListViewModel = WeatherListViewModel()
    private var lastUnitSelection: Unit!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.setUnit()
    }
}

//MARK: - FUNCTIONS -
extension WeatherListTableViewController {
    private func setUnit() {
        if let value = UserDefaults.standard.value(forKey: "unit") as? String {
            self.lastUnitSelection = Unit(rawValue: value)
        }
    }
}

//MARK: - SEGUES -
extension WeatherListTableViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddWeatherViewController" {
            prepareSegueForAddWeatherViewController(segue: segue)
        }
        
        if segue.identifier == "SettingsTableViewController" {
            prepareSegueForSettingsViewController(segue: segue)
        }
    }
    
    func prepareSegueForAddWeatherViewController(segue: UIStoryboardSegue) {
        guard let nav = segue.destination as? UINavigationController,
              let addWeatherVC = nav.viewControllers.first as? AddWeatherCityViewController else {
            fatalError("Not found")
        }
        
        addWeatherVC.delegate = self
    }
    
    func prepareSegueForSettingsViewController(segue: UIStoryboardSegue) {
        guard let nav = segue.destination as? UINavigationController,
              let settingsTVC = nav.viewControllers.first as? SettingsTableViewController else {
            fatalError("Not found")
        }
        
        settingsTVC.delegate = self
    }
}

//MARK: - TABLEVIEW DATASOURCE -
extension WeatherListTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        weatherListViewModel.numberOfRows(section)
    }
    
    override func tableView(_ tableView: UITableView,
                            heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell",
                                                 for: indexPath) as! WeatherCell
        
        let weatherViewModel = weatherListViewModel.modelAt(indexPath.row)
        
        cell.configure(weatherViewModel)
        
        return cell
    }
}

//MARK: - ADDWEATHER DELEGATE -
extension WeatherListTableViewController: AddWeatherDelegate {
    func addWeatherDidSave(viewModel: WeatherViewModel) {
        weatherListViewModel.addWeatherViewModel(viewModel)
        self.tableView.reloadData()
    }
}

//MARK: - SETTINGS DELEGATE -
extension WeatherListTableViewController: SettingsDelegate {
    func settingsDone(viewModel: SettingsViewModel) {
        if lastUnitSelection.rawValue != viewModel.selectedUnit.rawValue {
            weatherListViewModel.updateUnit(to: viewModel.selectedUnit)
            tableView.reloadData()
            lastUnitSelection = Unit(rawValue: viewModel.selectedUnit.rawValue)
        }
    }
}
