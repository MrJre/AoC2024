import Foundation

struct InputParser {
    let input: String

    func parse() -> [[Int]] {
        let result = input.components(separatedBy: "\n")

        let lines = result.filter { !$0.isEmpty }.map { line in
            line.split(separator: " ")
                .map { String($0) }
                .compactMap(Int.init)
        }

        return lines
    }
}
