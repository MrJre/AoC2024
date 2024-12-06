import Foundation
import Testing
@testable import Day6

struct Day6ExampleTests {

    @Test func exampleOne() {
        let input = """
        ....#.....
        .........#
        ..........
        ..#.......
        .......#..
        ..........
        .#..^.....
        ........#.
        #.........
        ......#...
        """

        let parseResult = InputParser(input: input).parse()
        let result = Day6(input: parseResult).part1()

        #expect(result == 41)
    }

    @Test func examplePart2() {
        let input = """
        ....#.....
        .........#
        ..........
        ..#.......
        .......#..
        ..........
        .#..^.....
        ........#.
        #.........
        ......#...
        """

        let parseResult = InputParser(input: input).parse()
        let result = Day6(input: parseResult).part2()

        #expect(result == 6)
    }
}
