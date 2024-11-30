import Foundation
import Testing
@testable import Day1

struct Day1ExampleTests {

    @Test func inputPart1() {
        let input = """
        3   4
        4   3
        2   5
        1   3
        3   9
        3   3
        """

        let parseResult = InputParser(input: input).parse()
        let result = Day1(input: parseResult).part1()

        #expect(result == 11)
    }

    @Test func inputPart2() {
        let input = """
        3   4
        4   3
        2   5
        1   3
        3   9
        3   3
        """

        let parseResult = InputParser(input: input).parse()
        let result = Day1(input: parseResult).part2()

        #expect(result == 31)
    }
}
