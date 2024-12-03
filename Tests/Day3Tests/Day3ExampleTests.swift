import Foundation
import Testing
@testable import Day3

struct Day3ExampleTests {

    @Test func input() {
        let input = """
        xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))
        """

        let parseResult = InputParser(input: input).parse()
        let result = Day3(input: parseResult).part1()

        #expect(result == 161)
    }

    @Test func inputPart2() {
        let input = """
        xmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))
        """

        let parseResult = InputParser(input: input).parse()
        let result = Day3(input: parseResult).part2()

        #expect(result == 48)
    }
}
