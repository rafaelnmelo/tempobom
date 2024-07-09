import UIKit

class WeatherListTableViewController: UITableViewController {

    private var weatherListViewModel = WeatherListViewModel()
    
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

//MARK: - DELEGATE -
extension WeatherListTableViewController: AddWeatherDelegate {
    func addWeatherDidSave(viewModel: WeatherViewModel) {
        weatherListViewModel.addWeatherViewModel(viewModel)
        self.tableView.reloadData()
    }
}
