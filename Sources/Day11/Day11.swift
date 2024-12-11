import Foundation
import PuzzleCore

struct Day11: Puzzle {

    let input: [Int]

    func part1() -> Int {
        var mem: [Rec: Int] = [:]
        return nextSequence(from: input, count: 25, mem: &mem)
    }

    func part2() -> Int {
        var mem: [Rec: Int] = [:]
        return nextSequence(from: input, count: 75, mem: &mem)
    }

    func nextSequence(from sequence: [Int], count: Int, mem: inout [Rec: Int]) -> Int {
        count > 0 ? sequence.reduce(0) {
            let parsed = parse(num: $1)
            let score = mem[Rec(num: $1, rec: count)] ?? nextSequence(from: parsed, count: count - 1, mem: &mem)
            mem[Rec(num: $1, rec: count)] = score
            return $0 + score
        } : sequence.count
    }

    func parse(num: Int) -> [Int] {
        if num == 0 {
            return [1]
        } else if String(num).count % 2 == 0 {
            let string = String(num)
            let a = String(string.prefix(string.count / 2))
            let b = String(string.suffix(string.count / 2))
            return [Int(a)!, Int(b)!]
        } else {
            return [num * 2024]
        }
    }
}

struct Rec: Hashable {
    let num: Int
    let rec: Int
}
