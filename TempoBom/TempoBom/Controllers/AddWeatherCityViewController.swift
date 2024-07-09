import UIKit

class AddWeatherCityViewController: UIViewController {
    
    @IBOutlet weak var cityTextLabel: UILabel!
    
    @IBAction func saveCityButtonPressed() {
        
    }
    
    @IBAction func cancelButtonPressed() {
        self.dismiss(animated: true, completion: nil)
    }
}
