import Foundation
import Testing
@testable import Day3

struct Day3PuzzleTests {

    @Test func part1() throws {
        let file = file(forDay: 3)
        let input = InputParser(input: file).parse()

        let result = Day3(input: input).part1()
        #expect(result == 188192787)
    }

    @Test func part2() throws {
        let file = file(forDay: 3)
        let input = InputParser(input: file).parse()

        let result = Day3(input: input).part2()
        #expect(result == 113965544)
    }

    private func file(forDay day: Int) -> String {
        let url = Bundle.module.url(forResource: "Day\(day)", withExtension: ".txt")
        return try! String(contentsOf: url!, encoding: .utf8)
    }
}
