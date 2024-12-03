import Foundation
import PuzzleCore

struct Day3: Puzzle {

    let input: [[Expression]]

    func part1() -> Int {
        return input.map {
            $0.reduce(0) {
                switch $1 {
                case .mul(let a, let b):
                    a * b + $0
                default:
                    $0
                }
            }
        }.reduce(0, +)
    }

    func part2() -> Int {
        var isEnabled = true
        return input.map {
            return $0.reduce(0) { output, next in
                switch next {
                case .mul(let a, let b):
                    return isEnabled ? (a * b) + output : output
                case .do:
                    isEnabled = true
                    return output
                case .dont:
                    isEnabled = false
                    return output
                }
            }
        }.reduce(0, +)
    }
}
