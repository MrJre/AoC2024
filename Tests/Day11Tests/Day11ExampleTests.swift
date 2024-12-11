import Foundation
import Testing
@testable import Day11

struct Day11ExampleTests {

    @Test func exampleOne() {
        let input = """
        0 1 10 99 999
        """

        let parseResult = InputParser(input: input).parse()
        let result = Day11(input: parseResult).part1()

        #expect(result == 7)
    }

    @Test func exampleTwo() {
        let input = """
        125 17
        """

        let parseResult = InputParser(input: input).parse()
        let result = Day11(input: parseResult).part1()

        #expect(result == 55312)
    }

    @Test func examplePart2One() {
        let input = """
        0
        """

        let parseResult = InputParser(input: input).parse()
        let result = Day11(input: parseResult).part2()

        #expect(result == 0)
    }
}
