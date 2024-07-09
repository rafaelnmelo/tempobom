import UIKit

class AddWeatherCityViewController: UIViewController {
    
    @IBOutlet weak var cityTextLabel: UITextField!
    
    @IBAction func saveCityButtonPressed() {
        if let cityName = cityTextLabel.text,
           let weatherURL = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(cityName)&units=metric&appid=23d4c5080cb5ea567d3ace39f4538feb"){
            
            let weatherResource = Resource<Any>(url: weatherURL) { data in
                return data
            }
            
            Webservice().load(resource: weatherResource) { result in
                
            }
        }
    }
    
    @IBAction func cancelButtonPressed() {
        self.dismiss(animated: true, completion: nil)
    }
}
