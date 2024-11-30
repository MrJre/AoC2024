import Foundation

struct InputParser {
    let input: String

    func parse() -> ([Int], [Int]) {
        let result = input.components(separatedBy: "\n").filter { !$0.isEmpty }

        var listA: [Int] = []
        var listB: [Int] = []

        result.forEach {
            let line = $0.split(separator: "   ")
            listA.append(Int(String(line[0]))!)
            listB.append(Int(String(line[1]))!)
        }

        return (listA, listB)
    }
}
