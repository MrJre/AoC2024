//
//  File.swift
//  AoC2024
//
//  Created by Jerry Tromp on 10/12/2024.
//

import Foundation

public enum Direction: CaseIterable {
    case north
    case east
    case south
    case west
}

extension Direction {
    public var vec: Vec {
        switch self {
        case .north: Vec(x: 0, y: 1)
        case .east: Vec(x: -1, y: 0)
        case .south: Vec(x: 0, y: -1)
        case .west: Vec(x: 1, y: 0)
        }
    }

    public func rotatedRight() -> Direction {
        switch self {
        case .north: .east
        case .east: .south
        case .south: .west
        case .west: .north
        }
    }

    public var char: String {
        switch self {
        case .north: "N"
        case .east: "E"
        case .south: "S"
        case .west: "W"
        }
    }
}
