import Foundation
import Testing
@testable import Day5

struct Day5PuzzleTests {

    @Test func part1() throws {
        let file = file(forDay: 5)
        let input = InputParser(input: file).parse()

        let result = Day5(input: input).part1()
        #expect(result == 3608)
    }
    
    @Test func part2() throws {
        let file = file(forDay: 5)
        let input = InputParser(input: file).parse()

        let result = Day5(input: input).part2()
        #expect(result == 4922)
    }

    private func file(forDay day: Int) -> String {
        let url = Bundle.module.url(forResource: "Day\(day)", withExtension: ".txt")
        return try! String(contentsOf: url!, encoding: .utf8)
    }
}
