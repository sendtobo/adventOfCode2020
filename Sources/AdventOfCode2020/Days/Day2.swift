//
//  Day2.swift
//  AdventOfCode2020
//
//  Created by Bo Oelkers on 11/29/20.
//

import SwifterSwift

public struct Day2: Day {
    struct Policy {
        enum ValidationRule {
            case count
            case position
            
            func isValid(password: String, policy: Policy) -> Bool {
                switch self {
                case .count:
                    let count = password.reduce(0) { result, char in
                        return result + (String(char) == policy.validator ? 1 : 0)
                    }
                    return count >= policy.first && count <= policy.second
                case .position: // Not Zero Indexed
                    guard let firstString = password[policy.first - 1] else { return false }
                    let firstValid = firstString == policy.validator
                    guard let secondString = password[policy.second - 1] else { return false }
                    let secondValid = secondString == policy.validator
                    return !((firstValid && secondValid) || (!firstValid && !secondValid))
                }
            }
        }
        
        let first: Int
        let second: Int
        let validator: String
        
        init(input: String) { // ex: 1-13 a
            let numbersAndLetter = input.split(separator: " ").map({ String($0) }) // ("1-13","a")
            self.validator = numbersAndLetter[1] // a
            let numbers = numbersAndLetter[0].split(separator: "-").map({ String($0) }) // ("1","13")
            self.first = Int(numbers[0])! // 1
            self.second = Int(numbers[1])! // 13
        }
        
        func isValid(password: String, validationRule: ValidationRule) -> Bool {
            validationRule.isValid(password: password, policy: self)
        }
    }

	public var name = "2"
	
	public init() { }
	
	public func first(_ input: String) -> CustomStringConvertible {
        numberOfValidPasswords(validateBy: .count, input: input)
	}
	
	public func second(_ input: String) -> CustomStringConvertible {
        numberOfValidPasswords(validateBy: .position, input: input)
	}
    
    private func numberOfValidPasswords(validateBy validationRule: Policy.ValidationRule, input: String) -> Int {
        let inputs = input.splitByNewLine
        var valids = 0
        for input in inputs {
            let halfs = input.split(separator: ":").map({ String($0).trimmed })
            let policy = Policy(input: halfs[0])
            if policy.isValid(password: halfs[1].replacingOccurrences(of: " ", with: ""), validationRule: validationRule) {
                valids+=1
            }
        }
        return valids
    }
}
