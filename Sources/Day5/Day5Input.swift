import Foundation

struct InputParser {
    let input: String

    func parse() -> ([Ordering], [[Int]]) {
        let result = input.components(separatedBy: "\n")

        let lines = result.split(separator: "")
        let orderingLines = lines[0]
        let pageLines = lines[1]

        let orderings = orderingLines
            .map { $0.split(separator: "|").map(String.init) }
            .map { Ordering(first: Int($0[0])!, last: Int($0[1])!) }

        let pages = pageLines
            .map {
                $0.split(separator: ",")
                    .map(String.init)
                    .compactMap(Int.init)
            }

        return (orderings, pages)
    }
}

struct Ordering: Hashable {
    let first: Int
    let last: Int
}

extension Ordering: CustomStringConvertible {
    var description: String {
        "\(first)|\(last)"
    }
}
