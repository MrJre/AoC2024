import Foundation
import Testing
@testable import Day10

struct Day10ExampleTests {

    @Test func exampleOne() {
        let input = """
        ...0...
        ...1...
        ...2...
        6543456
        7.....7
        8.....8
        9.....9
        """

        let parseResult = InputParser(input: input).parse()
        let result = Day10(input: parseResult).part1()

        #expect(result == 2)
    }

    @Test func exampleTwo() {
        let input = """
        ..90..9
        ...1.98
        ...2..7
        6543456
        765.987
        876....
        987....
        """

        let parseResult = InputParser(input: input).parse()
        let result = Day10(input: parseResult).part1()

        #expect(result == 4)
    }

    @Test func exampleThree() {
        let input = """
        10..9..
        2...8..
        3...7..
        4567654
        ...8..3
        ...9..2
        .....01
        """

        let parseResult = InputParser(input: input).parse()
        let result = Day10(input: parseResult).part1()

        #expect(result == 3)
    }

    @Test func exampleFour() {
        let input = """
        89010123Pu
        78121874
        87430965
        96549874
        45678903
        32019012
        01329801
        10456732
        """

        let parseResult = InputParser(input: input).parse()
        let result = Day10(input: parseResult).part1()

        #expect(result == 36)
    }
}
