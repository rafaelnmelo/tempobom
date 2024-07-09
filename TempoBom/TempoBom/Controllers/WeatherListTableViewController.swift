import UIKit

class WeatherListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddWeatherViewController" {
            prepareSegueForAddWeatherViewController(segue: segue)
        }
    }
    
    func prepareSegueForAddWeatherViewController(segue: UIStoryboardSegue) {
        guard let nav = segue.destination as? UINavigationController,
              let addWeatherVC = nav.viewControllers.first as? AddWeatherCityViewController else {
            fatalError("Not found")
        }
        
        addWeatherVC.delegate = self
    }
}

//MARK: - TABLEVIEW DATASOURCE -
extension WeatherListTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCell",
                                                 for: indexPath) as! WeatherCell
        cell.cityNameLabel.text = "Rio"
        cell.temperatureLabel.text = "40"
        return cell
    }
}

//MARK: - DELEGATE -
extension WeatherListTableViewController: AddWeatherDelegate {
    func addWeatherDidSave(viewModel: WeatherViewModel) {
        print(viewModel)
    }
}
