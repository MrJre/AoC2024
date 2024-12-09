import Foundation

struct InputParser {
    let input: String

    func parse() -> [Int] {
        input
            .components(separatedBy: "\n")
            .filter { !$0.isEmpty }
            .first!
            .map(String.init)
            .compactMap(Int.init)
    }
}
