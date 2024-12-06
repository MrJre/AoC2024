import Foundation
import ToolBox

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
