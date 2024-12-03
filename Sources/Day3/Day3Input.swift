import Foundation
import RegexBuilder

struct InputParser {
    let input: String

    func parse() -> [[Expression]] {
        let result = input.components(separatedBy: "\n").filter { !$0.isEmpty }
        let regex = Regex {
            ChoiceOf {
                Regex {
                    One("mul")
                    One("(")
                    Capture {
                        OneOrMore(.digit)
                    }
                    One(",")
                    Capture {
                        OneOrMore(.digit)
                    }
                    One(")")
                }
                Regex {
                    One("do()")
                }
                Regex {
                    One("don't()")
                }
            }
        }

        return result.map {
            $0.matches(of: regex).map {
                return switch $0.output.0 {
                case "do()": Expression.do
                case "don't()": Expression.dont
                default: Expression.mul(Int(String($0.output.1!))!, Int(String($0.output.2!))!)
                }
            }
        }
    }
}

enum Expression {
    case mul(Int, Int)
    case `do`
    case dont
}
