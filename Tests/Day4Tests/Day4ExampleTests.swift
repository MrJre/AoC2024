import Foundation
import Testing
@testable import Day4

struct Day4ExampleTests {

    @Test func input() {
        let input = """
        ..X...
        .SAMX.
        .A..A.
        XMAS.S
        .X....
        """

        let parseResult = InputParser(input: input).parse()
        let result = Day4(input: parseResult).part1()

        #expect(result == 4)
    }

    @Test func example() {
        let input = """
        MMMSXXMASM
        MSAMXMSMSA
        AMXSXMAAMM
        MSAMASMSMX
        XMASAMXAMM
        XXAMMXXAMA
        SMSMSASXSS
        SAXAMASAAA
        MAMMMXMMMM
        MXMXAXMASX
        """

        let parseResult = InputParser(input: input).parse()
        let result = Day4(input: parseResult).part1()

        #expect(result == 18)
    }
}
