import Foundation

struct InputParser {
    let input: String

    func parse() -> [Expression] {
        let result = input.components(separatedBy: "\n").filter { !$0.isEmpty }

        return result.map {
            let comp = $0.components(separatedBy: ":")
            let result = Int(comp[0])!
            let numbers = comp[1].components(separatedBy: .whitespaces).compactMap(Int.init)
            return Expression(result: result, numbers: numbers)
        }
    }
}

struct Expression {
    let result: Int
    let numbers: [Int]
}

extension Expression: CustomStringConvertible {
    var description: String {
        "\(result): \(numbers)"
    }
}
