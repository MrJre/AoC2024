import Foundation
import PuzzleCore
import PuzzleToolBox
import Algorithms

struct Day8: Puzzle {

    let input: Grid

    func part1() -> Int {
        var set = Set<Vec>()
        let nodes = input.nodes.filter { $0.char != "." }
        let grouped = nodes.grouped { $0.char }

        for key in grouped.keys {
            for perm in grouped[key]!.combinations(ofCount: 2).map({ $0.map { $0.point }}) {
                let p1 = perm.first!
                let p2 = perm.last!

                let delta = p2 - p1
                let r1 = p1 - delta
                let r2 = p2 + delta

                for c in [r1, r2] where input.contains(point: c) {
                    set.insert(c)
                }
            }
        }

        return set.count
    }

    func part2() -> Int {
        var set = Set<Vec>()
        let nodes = input.nodes.filter { $0.char != "." }
        let grouped = nodes.grouped { $0.char }

        for key in grouped.keys {
            for perm in grouped[key]!.combinations(ofCount: 2).map({ $0.map { $0.point }}) {
                let p1 = perm.first!
                let p2 = perm.last!
                let delta = p2 - p1

                var r1 = p1 - delta
                while input.contains(point: r1) {
                    set.insert(r1)
                    r1 = r1 - delta
                }

                var r2 = p2 + delta
                while input.contains(point: r2) {
                    set.insert(r2)
                    r2 = r2 + delta
                }

                set.insert(p1)
                set.insert(p2)
            }
        }

        return set.count
    }
}
