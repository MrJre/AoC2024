//
//  File.swift
//  AoC2024
//
//  Created by Jerry Tromp on 06/12/2024.
//

import Foundation

public struct Grid {
    public let width: Int
    public let height: Int
    public let nodes: [Node]

    public init(width: Int, height: Int, nodes: [Node]) {
        self.width = width
        self.height = height
        self.nodes = nodes
    }

    public func nodeAt(x: Int, y: Int) -> Node? {
        guard contains(point: Point(x: x, y: y)) else { return nil }
        return nodes[y * width + x]
    }

    public func nodeAt(point p: Point) -> Node? {
        guard contains(point: p) else { return nil }
        return nodes[p.y * width + p.x]
    }

    public func contains(point p: Point) -> Bool {
        0..<width ~= p.x && 0..<height ~= p.y
    }
}

extension Grid: CustomStringConvertible {
    public var description: String {
        var result: String = ""

        for y in 0..<height {
            for x in 0..<width {
                result.append(nodeAt(x: x, y: y)!.char)
            }
            result.append("\n")
        }
        return result
    }
}

