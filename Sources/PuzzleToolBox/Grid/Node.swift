import Foundation

public struct Node {
    public let x: Int
    public let y: Int
    public let char: String

    public var point: Vec { Vec(x: x, y: y) }

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
