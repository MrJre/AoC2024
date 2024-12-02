import Foundation
import PuzzleCore

struct Day1: Puzzle {

    let input: ([Int], [Int])

    func part1() -> Int {
        let listA = input.0.sorted()
        let listB = input.1.sorted()

        return zip(listA, listB)
            .map { abs($0.distance(to: $1)) }
            .reduce(0, +)
    }

    func part2() -> Int {
        let listA = input.0.sorted()
        let listB = input.1.sorted()

        var listACounts: [Int: Int] = [:]

        for number in listA {
            listACounts[number] = (listACounts[number] ?? 0) + 1
        }

        return listACounts.keys
            .map { key in listB.filter { $0 == key }.count * listACounts[key]! * key }
            .reduce(0, +)
    }
}
