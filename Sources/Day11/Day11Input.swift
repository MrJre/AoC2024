import Foundation

struct InputParser {
    let input: String

    func parse() -> [Int] {
        input
            .components(separatedBy: "\n")
            .filter { !$0.isEmpty }
            .first!
            .components(separatedBy: .whitespaces)
            .compactMap(Int.init)
    }
}
