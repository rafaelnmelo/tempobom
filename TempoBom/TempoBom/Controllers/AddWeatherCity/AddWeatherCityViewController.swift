import UIKit

protocol AddWeatherDelegate {
    func addWeatherDidSave(viewModel: WeatherViewModel)
}

class AddWeatherCityViewController: UIViewController {
    
    @IBOutlet weak var cityTextLabel: UITextField!
    private var addWeatherViewModel = AddWeatherViewModel()
    var delegate: AddWeatherDelegate?
    
    @IBAction func saveCityButtonPressed() {
        if let cityName = cityTextLabel.text{
            addWeatherViewModel.createWeatherFromWebservice(for: cityName) { viewModel in
                self.delegate?.addWeatherDidSave(viewModel: viewModel)
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func cancelButtonPressed() {
        self.dismiss(animated: true, completion: nil)
    }
}
