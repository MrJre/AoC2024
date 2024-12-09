import Foundation
import PuzzleCore

struct Day9: Puzzle {

    let input: [Int]

    func part1() -> Int {
        var result = unwrap(list: input).0

        var indicesLookup = result.indices { $0 != "." }.ranges.flatMap(Array.init)
        let emptySpots = result.count - indicesLookup.count
        indicesLookup = indicesLookup.suffix(emptySpots)

        for (i, string) in result.enumerated() {
            guard let last = indicesLookup.last, last > i else { break }
            if string == "." {
                result.swapAt(i, last)
                indicesLookup.removeLast()
            }
        }

        return result.filter { $0 != "." }.enumerated().map {
            $0.offset * Int($0.element)!
        }.reduce(0, +)
    }

    func unwrap(list: [Int]) -> ([String], [Int: Range<Int>]) {
        var decompacted: [String] = []
        var indices = [Int: Range<Int>]()
        var id = 0

        for (i, number) in list.enumerated() {
            if i % 2 == 1 {
                decompacted.append(contentsOf: Array<String>(repeating: ".", count: number))
                id += 1
            } else {
                let end = decompacted.endIndex
                decompacted.append(contentsOf: Array<String>(repeating: String(id), count: number))
                let range = end..<decompacted.endIndex
                indices[id] = range
            }
        }

        return (decompacted, indices)
    }

    func part2() -> Int {
        let unwrap = unwrap(list: input)

        var result = unwrap.0
        let indicesLookup = unwrap.1

        print(result, "(\(result.count))")
        print()

        var keys = indicesLookup.keys.sorted(by: >)
        var holes = Array(result.indices { $0 == "." }.ranges)

        while !keys.isEmpty {
            let key = keys.first!

            for (i, hole) in holes.enumerated() {
                let rangeToFit = indicesLookup[key]!
                if hole.count >= rangeToFit.count {
                    let spaceToTake = hole.prefix(rangeToFit.count)
                    result.replaceSubrange(spaceToTake, with: result[rangeToFit])
                    result.replaceSubrange(rangeToFit, with: Array(repeating: ".", count: rangeToFit.count))

                    let remainder = hole.suffix(hole.count - rangeToFit.count)
                    if remainder.isEmpty { holes.remove(at: i) }
                    else { holes[i] = hole.suffix(hole.count - rangeToFit.count) }

                    break
                }
            }

            print(key, result)

            keys.removeFirst()
        }
        print()
        print(result)

        return result.enumerated().map {
            $0.offset * (Int($0.element) ?? 0)
        }.reduce(0, +)
    }
}
