import Foundation
import PuzzleCore

struct Day2: Puzzle {

    let input: [[Int]]

    func part1() -> Int {
        input.map { isReportSafe($0) }.filter { $0 }.count
    }

    func part2() -> Int {
        input.map { isReportSafe($0, allowedErrors: 1) }.filter { $0 }.count
    }

    func isReportSafe(_ report: [Int], allowedErrors: Int = 0) -> Bool {
        var previous = report[0]
        var increasing: Bool = true
        var errors: Int = 0

        for (i, number) in report[1...].enumerated() {
            var foundError = false
            if i == 0 {
                increasing = number > previous
            }
            if !(1...3 ~= abs(previous.distance(to: number))) {
                errors += 1
                if errors > allowedErrors {
                    return false
                }
                foundError = true
            }
            if !(increasing == (number > previous)) && !foundError {
                errors += 1
                if errors > allowedErrors {
                    return false
                }
            }
            previous = number
        }
        return true
    }
}


