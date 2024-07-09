import Foundation

class WeatherListViewModel {
    private var weatherViewModels = [WeatherViewModel]()
    
    func addWeatherViewModel(_ viewmodel: WeatherViewModel) {
        weatherViewModels.append(viewmodel)
    }
    
    func numberOfRows(_ section: Int) -> Int {
        weatherViewModels.count
    }
    
    func modelAt(_ index: Int) -> WeatherViewModel {
        weatherViewModels[index]
    }
}

class WeatherViewModel {
    let weather: WeatherResponse
    var city: String {
        weather.name
    }
    var temperature: Double {
        weather.main.temp
    }
    
    init(weather: WeatherResponse) {
        self.weather = weather
    }
    
}
