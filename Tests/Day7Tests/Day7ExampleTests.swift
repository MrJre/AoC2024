import Foundation
import Testing
@testable import Day7

struct Day7ExampleTests {

    @Test func exampleOne() {
        let input = """
        190: 10 19
        3267: 81 40 27
        83: 17 5
        156: 15 6
        7290: 6 8 6 15
        161011: 16 10 13
        192: 17 8 14
        21037: 9 7 18 13
        292: 11 6 16 20
        """

        let parseResult = InputParser(input: input).parse()
        let result = Day7(input: parseResult).part1()

        #expect(result == 3749)
    }

    @Test func examplePart2One() {
        let input = """
        190: 10 19
        3267: 81 40 27
        83: 17 5
        156: 15 6
        7290: 6 8 6 15
        161011: 16 10 13
        192: 17 8 14
        21037: 9 7 18 13
        292: 11 6 16 20
        """

        let parseResult = InputParser(input: input).parse()
        let result = Day7(input: parseResult).part2()

        #expect(result == 11387)
    }
}
