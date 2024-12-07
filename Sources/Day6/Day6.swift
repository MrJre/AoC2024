import Foundation
import PuzzleCore
import ToolBox

struct Day6: Puzzle {

    let input: Grid

    init(input: Grid) {
        self.input = input
    }

    func part1() -> Int {
        let nodes = findPathNodes(in: input)
        return nodes.count
    }

    func part2() -> Int {
        let path = findPathNodes(in: input)

        let nodes = input.nodes
        let startNode = nodes.first { $0.char == "^" }!
        let obstacles = path.filter { !($0.x == startNode.x && $0.y == startNode.y) }

        var loops = 0

        for obstacle in obstacles {
            var nodes = input.nodes
            nodes[obstacle.y * input.width + obstacle.x] = Node(x: obstacle.x, y: obstacle.y, char: "O")

            let path = findPathNodes(in: Grid(width: input.width, height: input.height, nodes: nodes))
            if path.isEmpty { loops += 1 }
        }

        return loops
    }

    func neighbour(of current: Node, direction: Direction, grid: Grid) -> Node? {
        grid.nodeAt(x: current.x - direction.vector().x, y: current.y - direction.vector().y)
    }

    func findPathNodes(in grid: Grid) -> [Node] {
        var nodes = grid.nodes
        var direction = Direction.north
        var current = grid.nodes.first { $0.char == "^" }

        var visited = Set<Node>()

        while(current != nil) {
            guard let node = current else { fatalError() }
            let visitedNode = Node(x: node.x, y: node.y, char: direction.char())
            if visited.contains(visitedNode) { return [] } else { visited.insert(visitedNode) }
            nodes[visitedNode.y * input.width + visitedNode.x] = visitedNode

            guard let next = neighbour(of: visitedNode, direction: direction, grid: grid) else { break }
            switch next.char {
            case "#", "O":
                current = neighbour(of: visitedNode, direction: direction.rotatedRight(), grid: grid)
                direction = direction.rotatedRight()
            default:
                current = next
            }
        }

        return nodes.filter { ["W", "E", "S", "N"].contains($0.char) }
    }
}

enum Direction {
    case north
    case east
    case south
    case west

    func vector() -> (x: Int, y: Int) {
        switch self {
        case .north: (0, 1)
        case .east: (-1, 0)
        case .south: (0, -1)
        case .west: (1, 0)
        }
    }

    func rotatedRight() -> Direction {
        switch self {
        case .north: .east
        case .east: .south
        case .south: .west
        case .west: .north
        }
    }

    func char() -> String {
        switch self {
        case .north: "N"
        case .east: "E"
        case .south: "S"
        case .west: "W"
        }
    }
}
