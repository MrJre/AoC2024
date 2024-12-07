import Foundation
import PuzzleCore
import Algorithms

struct Day7: Puzzle {

    let input: [Expression]

    func part1() -> Int {
        var valids = [Expression]()
        let operators = ["sum", "mul"]
        for expression in input {
            if isValid(expression: expression, operators: operators) {
                valids.append(expression)
            }
        }

        return valids.map(\.result).reduce(0, +)
    }

    func part2() -> Int {
        var valids = [Expression]()
        let operators = ["sum", "mul", "cat"]
        for expression in input {
            if isValid(expression: expression, operators: operators) {
                valids.append(expression)
            }
        }

        return valids.map(\.result).reduce(0, +)
    }

    func isValid(expression: Expression, operators: [String]) -> Bool {
        let combs = combos(elements: operators, k: expression.numbers.count - 1)
        //            print(expression, combs.count)
        //            print(combs)
        for comb in combs {
            var resultToCheck = expression.numbers.first!
            for i in 1..<expression.numbers.count {
                //                    print(comb[i-1], resultToCheck, expression.numbers[i])
                switch comb[i-1] {
                case "sum": resultToCheck = sum(a: resultToCheck, b: expression.numbers[i])
                case "mul": resultToCheck = mul(a: resultToCheck, b: expression.numbers[i])
                case "cat": resultToCheck = cat(a: resultToCheck, b: expression.numbers[i])
                default: break
                }
            }
            //               print(resultToCheck)

            if resultToCheck == expression.result {
                print("ADD:", expression)
                //                    print()
                return true
            }
        }
        return false
    }
}

func sum(a: Int, b: Int) -> Int { a + b }
func mul(a: Int, b: Int) -> Int { a * b }
func cat(a: Int, b: Int) -> Int { Int(String("\(a)\(b)"))! }


func combos<T>(elements: ArraySlice<T>, k: Int) -> [[T]] where T: Hashable {
    if k == 0 {
        return [[]]
    }
    
    var res = Set<[T]>()

    for element in elements {
        let head = [element]
        let subcombos = combos(elements: elements, k: k - 1)
        var ret = subcombos.map { head + $0 }
        ret += combos(elements: elements.dropFirst(), k: k)
        for c in ret {
            res.insert(c)
        }
    }
    return Array(res)
}

func combos<T>(elements: Array<T>, k: Int) -> [[T]] where T: Hashable {
    return combos(elements: ArraySlice(elements), k: k)
}


