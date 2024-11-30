import Foundation

public protocol Puzzle {
    associatedtype Input
    associatedtype P1Output
    associatedtype P2Output

    var input: Input { get }

    func part1() -> P1Output
    func part2() -> P2Output
}