import Foundation
import PuzzleCore

struct Day5: Puzzle {

    let input: (orderings: [Ordering], pages: [[Int]])

    func part1() -> Int {
        let orderingsLookupTable = input.orderings.reduce(into: [:]) {
            $0[$1.first, default: []].append($1.last)
        }

        let valids = input.pages.filter {
            arePagesInCorrectOrder(pages: $0, lookup: orderingsLookupTable)
        }

        return valids.map { $0[$0.count / 2] }.reduce(0, +)
    }

    func arePagesInCorrectOrder(pages: [Int], lookup: [Int: [Int]]) -> Bool {
        for (index, page) in pages.enumerated() {
            guard let pagesAfter = lookup[page] else { continue }
            for pageAfter in pagesAfter {
                guard let pageAfterIndex = pages.firstIndex(of: pageAfter) else { continue }
                if pageAfterIndex < index { return false }
            }
        }
        return true
    }


    func part2() -> Int {
        let orderingsLookupTable = input.orderings.reduce(into: [:]) {
            $0[$1.first, default: []].append($1.last)
        }

        let invalids = input.pages.filter { !arePagesInCorrectOrder(pages: $0, lookup: orderingsLookupTable) }
        let fixed = invalids.map { order(pages: $0, lookup: orderingsLookupTable) }

        return fixed.map { $0[$0.count / 2] }.reduce(0, +)
    }

    func order(pages: [Int], lookup: [Int: [Int]]) -> [Int] {
        var orderedPages = pages

        for page in pages {
            guard let index = orderedPages.firstIndex(of: page) else { continue }
            guard let pagesAfter = lookup[page] else { continue }

            let indexToMoveTo = pagesAfter.reduce(into: Int.max) { sum, pageAfter in
                if let pageAfterIndex = orderedPages.firstIndex(of: pageAfter) {
                    sum = min(sum, pageAfterIndex)
                }
            }

            if index > indexToMoveTo {
                let from = RangeSet([index], within: orderedPages)
                orderedPages.moveSubranges(from, to: indexToMoveTo)
            }
        }

        return orderedPages
    }
}

