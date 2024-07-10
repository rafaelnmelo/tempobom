import Foundation

enum Unit: String, CaseIterable {
    case celsius = "metric"
    case fahrenheit = "imperial"
}

extension Unit {
    var displayName: String {
        get {
            switch self {
            case .celsius:
                return "Celsius"
            case .fahrenheit:
                return "Fahrenheit"
            }
        }
    }
}

class SettingsViewModel {
    let units = Unit.allCases
    let userDefaults = UserDefaults.standard
    
    var selected: Unit {
        get {
            var unitValue = ""
            if let value = userDefaults.value(forKey: "unit") as? String {
                unitValue = value
            }
            return Unit(rawValue: unitValue)!
        }
        set {
            userDefaults.set(newValue.rawValue, forKey: "unit")
        }
    }
}
