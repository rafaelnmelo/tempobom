import Foundation

class WeatherListViewModel {
    private(set) var weatherViewModels = [WeatherViewModel]()
    
    private func toCelsius() {
        weatherViewModels = weatherViewModels.map({ viewModel in
            let weatherModel = viewModel
            weatherModel.temperature = (weatherModel.temperature - 32) * 5/9
            return weatherModel
        })
    }
    
    private func toFahrenheit() {
        weatherViewModels = weatherViewModels.map({ viewModel in
            let weatherModel = viewModel
            weatherModel.temperature = (weatherModel.temperature * 9/5) + 32
            return weatherModel
        })
    }
    
    func addWeatherViewModel(_ viewmodel: WeatherViewModel) {
        weatherViewModels.append(viewmodel)
    }
    
    func numberOfRows(_ section: Int) -> Int {
        weatherViewModels.count
    }
    
    func modelAt(_ index: Int) -> WeatherViewModel {
        weatherViewModels[index]
    }
    
    func updateUnit(to unit: Unit) {
        switch unit {
        case .celsius:
            toCelsius()
        case .fahrenheit:
            toFahrenheit()
        }
    }
}

class WeatherViewModel {
    let weather: WeatherResponse
    var temperature: Double
    
    var city: String {
        weather.name
    }
    
    init(weather: WeatherResponse) {
        self.weather = weather
        self.temperature = weather.main.temp
    }
    
}
