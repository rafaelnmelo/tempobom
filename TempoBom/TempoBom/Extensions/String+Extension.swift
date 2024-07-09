import Foundation

extension String {
    func escaped() -> String {
        self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? self
    }
}
