import Foundation

class AddWeatherViewModel {
    
    func createWeatherFromWebservice(for city: String, completion: @escaping (WeatherViewModel) -> Void) {
        
        let weatherURL = Constants.Urls.urlForWeatherByCity(city: city)
        
        let weatherResource = Resource<WeatherResponse>(url: weatherURL) { data in
            let weatherResponse = try? JSONDecoder().decode(WeatherResponse.self,
                                                             from: data)
            return weatherResponse
        }
        
        Webservice().load(resource: weatherResource) { result in
            if let weatherResource = result {
                let viewModel = WeatherViewModel(weather: weatherResource)
                completion(viewModel)
            }
        }
    }
}
