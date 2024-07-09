import Foundation

class WeatherListViewModel {
    
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
