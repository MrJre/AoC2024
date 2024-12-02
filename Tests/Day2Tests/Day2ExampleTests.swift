import Foundation
import Testing
@testable import Day2

struct Day2ExampleTests {

    @Test func input() {
        let input = """
        7 6 4 2 1
        1 2 7 8 9
        9 7 6 2 1
        1 3 2 4 5
        8 6 4 4 1
        1 3 6 7 9
        """

        let parseResult = InputParser(input: input).parse()
        let result = Day2(input: parseResult).part1()

        #expect(result == 2)
    }
}
