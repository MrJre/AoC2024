import Foundation
import PuzzleCore
import ToolBox

struct Day4: Puzzle {

    let input: Grid

    func part1() -> Int {
        input.nodes.map {
            if $0.char != "X" { return 0 }
            let expected = "M"
            let w = traverse(node: $0, direction: (x: -1, y: 0), expected: expected)
            let nw = traverse(node: $0, direction: (x: -1, y: -1), expected: expected)
            let n = traverse(node: $0, direction: (x: 0, y: -1), expected: expected)
            let ne = traverse(node: $0, direction: (x: 1, y: -1), expected: expected)
            let e = traverse(node: $0, direction: (x: 1, y: 0), expected: expected)
            let se = traverse(node: $0, direction: (x: 1, y: 1), expected: expected)
            let s = traverse(node: $0, direction: (x: 0, y: 1), expected: expected)
            let sw = traverse(node: $0, direction: (x: -1, y: 1), expected: expected)

            return [w, nw, n, ne, e, se, s, sw].filter { $0 }.count
        }.reduce(0, +)
    }

    func traverse(node: Node, direction: (x: Int, y: Int), expected: String) -> Bool {
        guard let next = neighbour(of: node, direction: direction), next.char == expected else { return false }
        return switch expected {
        case "S": true
        case "A": traverse(node: next, direction: direction, expected: "S")
        case "M": traverse(node: next, direction: direction, expected: "A")
        case "X": traverse(node: next, direction: direction, expected: "M")
        default: false
        }
    }

    func part2() -> Int {
        input.nodes.map {
            guard $0.char == "A",
                let nw = neighbour(of: $0, direction: (x: -1, y: -1)),
                let ne = neighbour(of: $0, direction: (x: 1, y: -1)),
                let se = neighbour(of: $0, direction: (x: 1, y: 1)),
                let sw = neighbour(of: $0, direction: (x: -1, y: 1)) else { return 0 }

            return { switch (nw.char, ne.char, se.char, sw.char) {
            case ("M", "M", "S", "S"): true
            case ("S", "M", "M", "S"): true
            case ("S", "S", "M", "M"): true
            case ("M", "S", "S", "M"): true
            default: false
            }}() ? 1 : 0
        }.reduce(0, +)
    }

    func neighbour(of current: Node, direction: (x: Int, y: Int)) -> Node? {
        input.nodeAt(x: current.x - direction.x, y: current.y - direction.y)
    }
}
