import Foundation
import Testing
@testable import Day10

struct Day10PuzzleTests {

    @Test func part1() throws {
        let file = file(forDay: 10)
        let input = InputParser(input: file).parse()

        let result = Day10(input: input).part1()
        #expect(result == 667)
    }
    
    @Test func part2() throws {
        let file = file(forDay: 10)
        let input = InputParser(input: file).parse()

        let result = Day10(input: input).part2()
        #expect(result == 1344)
    }

    private func file(forDay day: Int) -> String {
        let url = Bundle.module.url(forResource: "Day\(day)", withExtension: ".txt")
        return try! String(contentsOf: url!, encoding: .utf8)
    }
}
