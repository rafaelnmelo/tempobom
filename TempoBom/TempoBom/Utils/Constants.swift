import Foundation

struct Constants {
    
    struct Urls {
        
        static func urlForWeatherByCity(city: String) -> URL {
            
            // get the default settings for temperature
            let unit = (UserDefaults.standard.value(forKey: "unit") as? String) ?? "celsius"
            
            return URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city.escaped())&appid=23d4c5080cb5ea567d3ace39f4538feb&units=\(unit)")!
        }
        
    }
    
}
