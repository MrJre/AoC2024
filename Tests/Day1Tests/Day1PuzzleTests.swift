import Foundation
import Testing
@testable import Day1

struct Day1PuzzleTests {

    @Test func part1() throws {
        let file = file(forDay: 1)
        let input = InputParser(input: file).parse()

        let result = Day1(input: input).part1()
        #expect(result == 3569916)
    }
    
    @Test func part2() throws {
        let file = file(forDay: 1)
        let input = InputParser(input: file).parse()

        let result = Day1(input: input).part2()
        #expect(result == 26407426)
    }

    private func file(forDay day: Int) -> String {
        let url = Bundle.module.url(forResource: "Day\(day)", withExtension: ".txt")
        return try! String(contentsOf: url!)
    }
}
