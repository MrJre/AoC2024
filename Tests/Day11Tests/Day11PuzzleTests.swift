import Foundation
import Testing
@testable import Day11

struct Day11PuzzleTests {

    @Test func part1() throws {
        let file = file(forDay: 11)
        let input = InputParser(input: file).parse()

        let result = Day11(input: input).part1()
        #expect(result == 193269)
    }
    
    @Test func part2() throws {
        let file = file(forDay: 11)
        let input = InputParser(input: file).parse()

        let result = Day11(input: input).part2()
        #expect(result == 228449040027793)
    }

    private func file(forDay day: Int) -> String {
        let url = Bundle.module.url(forResource: "Day\(day)", withExtension: ".txt")
        return try! String(contentsOf: url!, encoding: .utf8)
    }
}
