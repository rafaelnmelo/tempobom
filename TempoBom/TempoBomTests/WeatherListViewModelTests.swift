import XCTest
@testable import TempoBom

class WeatherListViewModelTests: XCTestCase {

    private var weatherListViewModel: WeatherListViewModel!
    
    override func setUp() {
        super.setUp()
        self.weatherListViewModel = WeatherListViewModel()
        let firstWeather = Weather(temp: 32, humidity: 5)
        let brasiliaWeatherResponse = WeatherResponse(main: firstWeather,
                                              name: "Brasilia")
        let brasiliaWeatherVM = WeatherViewModel(weather: brasiliaWeatherResponse)
        self.weatherListViewModel.addWeatherViewModel(brasiliaWeatherVM)
        
        let secondWeather = Weather(temp: 72, humidity: 5)
        let rioWeatherResponse = WeatherResponse(main: secondWeather,
                                              name: "Rio")
        let rioWeatherVM = WeatherViewModel(weather: rioWeatherResponse)
        self.weatherListViewModel.addWeatherViewModel(rioWeatherVM)
    }
    
    func test_should_be_able_to_convert_to_celsius_successfully() {
        let celsiusTemperatures = [0,22.2222]
        
        weatherListViewModel?.updateUnit(to: .celsius)
        
        for (index, vm) in weatherListViewModel.weatherViewModels.enumerated() {
            XCTAssertEqual(round(vm.temperature), round(celsiusTemperatures[index]))
        }
        
    }
    
    override func tearDown() {
        super.tearDown()
        UserDefaults.standard.removeObject(forKey: "unit")
    }
}
