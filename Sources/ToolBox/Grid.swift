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
        guard 0..<width ~= x, 0..<height ~= y else { return nil }
        return nodes[y * width + x]
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


public struct Node {
    public let x: Int
    public let y: Int
    public let char: String

    public init(x: Int, y: Int, char: String) {
        self.x = x
        self.y = y
        self.char = char
    }
}

extension Node: Equatable {}
extension Node: Hashable {}
extension Node: CustomStringConvertible {
    public var description: String { "[\(char) - (\(x),\(y))]"}
}

