import UIKit

class WeatherCell: UITableViewCell {
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    func configure(_ viewmodel: WeatherViewModel) {
        self.cityNameLabel.text = viewmodel.city
        self.temperatureLabel.text = "\(String(describing: viewmodel.temperature.formatAsDegree()))"
    }
}
