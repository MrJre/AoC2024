import Foundation
import PuzzleCore
import PuzzleToolBox

struct Day10: Puzzle {

    let input: Grid

    func part1() -> Int {
        input.nodes
            .filter { $0.char == String(0) }
            .map {
                var visitedPeaks: Set<Node> = []
                return findPath(node: $0, visitedPeaks: &visitedPeaks, needsVisitation: true)
            }
            .reduce(0, +)
    }

    func part2() -> Int {
        input.nodes
            .filter { $0.char == String(0) }
            .map {
                var visitedPeaks: Set<Node> = []
                return findPath(node: $0, visitedPeaks: &visitedPeaks, needsVisitation: false)
            }
            .reduce(0, +)
    }

    func findPath(node: Node, visitedPeaks: inout Set<Node>, needsVisitation: Bool) -> Int {
        switch node.char {
        case "9":
            if !visitedPeaks.contains(node) || !needsVisitation {
                visitedPeaks.insert(node)
                return 1
            }
        case "0"..."8":
            let neighbours = findNeighbours(node: node, score: Int(node.char)! + 1)
            return neighbours
                .map { findPath(node: $0, visitedPeaks: &visitedPeaks, needsVisitation: needsVisitation) }
                .reduce(0, +)
        default: break
        }

        return 0
    }

    func findNeighbours(node: Node, score: Int) -> [Node] {
        Direction.allCases.compactMap { input.nodeAt(point: node.point + $0.vec) }.filter { $0.char == String(score) }
    }
}
