import Foundation
import Testing
@testable import Day5

struct Day5ExampleTests {

    @Test func exampleOne() {
        let input = """
        47|53
        97|13
        97|61
        97|47
        75|29
        61|13
        75|53
        29|13
        97|29
        53|29
        61|53
        97|53
        61|29
        47|13
        75|47
        97|75
        47|61
        75|61
        47|29
        75|13
        53|13
        
        75,47,61,53,29
        97,61,53,29,13
        75,29,13
        75,97,47,61,53
        61,13,29
        97,13,75,29,47
        """

        let parseResult = InputParser(input: input).parse()
        let result = Day5(input: parseResult).part1()

        #expect(result == 143)
    }

    @Test func exampleSubThree() {
        let input = """
        47|53
        97|13
        97|61
        97|47
        75|29
        61|13
        75|53
        29|13
        97|29
        53|29
        61|53
        97|53
        61|29
        47|13
        75|47
        97|75
        47|61
        75|61
        47|29
        75|13
        53|13
        
        75,29,13
        """

        let parseResult = InputParser(input: input).parse()
        let result = Day5(input: parseResult).part1()

        #expect(result == 29)
    }

    @Test func exampleSubFour() {
        let input = """
        47|53
        97|13
        97|61
        97|47
        75|29
        61|13
        75|53
        29|13
        97|29
        53|29
        61|53
        97|53
        61|29
        47|13
        75|47
        97|75
        47|61
        75|61
        47|29
        75|13
        53|13
        
        75,97,47,61,53
        """

        let parseResult = InputParser(input: input).parse()
        let result = Day5(input: parseResult).part1()

        #expect(result == 0)
    }

    @Test func exampleOnePart2() {
        let input = """
        47|53
        97|13
        97|61
        97|47
        75|29
        61|13
        75|53
        29|13
        97|29
        53|29
        61|53
        97|53
        61|29
        47|13
        75|47
        97|75
        47|61
        75|61
        47|29
        75|13
        53|13
        
        75,47,61,53,29
        97,61,53,29,13
        75,29,13
        75,97,47,61,53
        61,13,29
        97,13,75,29,47
        """

        let parseResult = InputParser(input: input).parse()
        let result = Day5(input: parseResult).part2()

        #expect(result == 123)
    }

}
