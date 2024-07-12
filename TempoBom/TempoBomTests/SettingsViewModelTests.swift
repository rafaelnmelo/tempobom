import XCTest
@testable import TempoBom

class SettingsViewModelTests: XCTestCase {
    
    private var settingsViewModel: SettingsViewModel?
    
    override func setUp() {
        super.setUp()
        self.settingsViewModel = SettingsViewModel()
    }
    
    func test_should_return_correct_display_name_for_celsius() {
        XCTAssertEqual(settingsViewModel?.selectedUnit.displayName, "Celsius")
    }
    
    func test_should_make_sure_that_default_selected_unit_is_celsius() {
        XCTAssertEqual(settingsViewModel?.selectedUnit, .celsius)
    }
    
    func test_should_be_able_to_save_user_unit_selection() {
        settingsViewModel?.selectedUnit = .celsius
        XCTAssertNotNil(UserDefaults.standard.value(forKey: "unit"))
    }
    
    override func tearDown() {
        super.tearDown()
        UserDefaults.standard.removeObject(forKey: "unit")
    }
}
