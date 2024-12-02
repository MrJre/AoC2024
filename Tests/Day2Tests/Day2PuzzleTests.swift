import Foundation
import Testing
@testable import Day2

struct Day2PuzzleTests {

    @Test func part1() throws {
        let file = file(forDay: 2)
        let input = InputParser(input: file).parse()

        let result = Day2(input: input).part1()
        #expect(result == 663)
    }
    
    @Test func part2() throws {
        let file = file(forDay: 2)
        let input = InputParser(input: file).parse()

        let result = Day2(input: input).part2()
        #expect(result == 692)
    }

    private func file(forDay day: Int) -> String {
        let url = Bundle.module.url(forResource: "Day\(day)", withExtension: ".txt")
        return try! String(contentsOf: url!, encoding: .utf8)
    }
}
