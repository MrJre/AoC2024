import Foundation

struct InputParser {
    let input: String

    func parse() -> Grid {
        let result = input.components(separatedBy: "\n").filter { !$0.isEmpty }

        var nodes: [Node] = []

        for (y, line) in result.enumerated() {
            for (x, token) in line.enumerated() {
                nodes.append(Node(x: x, y: y, char: String(token)))
            }
        }

        return Grid(width: result.first!.count, height: result.count, nodes: nodes)
    }
}

struct Grid {
    let width: Int
    let height: Int
    let nodes: [Node]

    func nodeAt(x: Int, y: Int) -> Node? {
        guard 0..<width ~= x, 0..<height ~= y else { return nil }
        return nodes[y * width + x]
    }
}

struct Node {
    let x: Int
    let y: Int
    let char: String
}
