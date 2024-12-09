import Foundation
import Testing
@testable import Day9

struct Day9ExampleTests {

    @Test func exampleOne() {
        let input = """
        2333133121414131402
        """

        let parseResult = InputParser(input: input).parse()
        let result = Day9(input: parseResult).part1()

        #expect(result == 1928)
    }

    @Test func exampleTwo() {
        let input = """
        2333133121414131402
        """

        let parseResult = InputParser(input: input).parse()
        let result = Day9(input: parseResult).part2()

        #expect(result == 2858)
    }
}
