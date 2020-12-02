//
//  File.swift
//  2020
//
//  Created by Bo Oelkers on 11/28/20.
//

public struct Day1: Day {
    public struct Result {
        public struct IndexedInt {
            var number: Int
            var index: Int
        }
        var numbers: [IndexedInt]
        var sum: Int {
            numbers.map({ $0.number }).reduce(1, *)
        }
        
        init(numbers: [(Int, Int)]) {
            self.numbers = numbers.map({ IndexedInt(number: $0, index: $1) })
        }
    }
    
    public var name = "1"
    private var target = 2020
    
    public init() { }
    
    public func first(_ input: String) -> CustomStringConvertible {
        guard let result = secondApproachToFirst(input) else {
            return ""
        }
        return result.sum
    }
    
    public func second(_ input: String) -> CustomStringConvertible {
        guard let result = secondApproachToSecond(input) else {
            return ""
        }
        return result.sum
    }
    
    private func firstApproachToFirst(_ input: String) -> String {
        let numbers = input.splitByNewLineInts
        for number in numbers {
            for innerNumber in numbers {
                if number + innerNumber == target {
                    return "\(number * innerNumber)"
                }
            }
        }
        return ""
    }
    
    private func secondApproachToFirst(_ input: String) -> Result? {
        let numbers = input.splitByNewLineInts.sorted()
        for i in 0..<numbers.count - 1 {
            let number = numbers[i]
            for j in (i + 1)..<numbers.count {
                let innerNumber = numbers[j]
                if number + innerNumber == target {
                    return Result(numbers: [(number, i), (innerNumber, j)])
                }
            }
        }
        return nil
    }
    
    private func firstApproachToSecond(_ input: String) -> String {
        let numbers = input.splitByNewLineInts
        for number in numbers {
            for innerNumber in numbers {
                for extraInnerNumber in numbers {
                    if number + innerNumber + extraInnerNumber == target {
                        return "\(number * innerNumber * extraInnerNumber)"
                    }
                }
            }
        }
        return ""
    }
    
    private func secondApproachToSecond(_ input: String) -> Result? {
        let numbers = input.splitByNewLineInts.sorted()
        for i in 0..<numbers.count - 2 {
            let number = numbers[i]
            for j in (i + 1)..<numbers.count - 1 {
                let innerNumber = numbers[j]
                for k in (i + 2)..<numbers.count {
                    let innerInnerNumber = numbers[k]
                    if number + innerNumber + innerInnerNumber == target {
                        return Result(numbers: [(number, i), (innerNumber, j), (innerInnerNumber, k)])
                    }
                }
            }
        }
        return nil
    }
    
//    private func genericApproach(depth: Int, numbers: [Int], target: Int) -> Result? {
//        let numbers = numbers.sorted()
//        for i in 0..<numbers.count - (depth - 1) {
//            if let result = genericApproachHelper(depth: <#T##Int#>, numbers: <#T##[Int]#>, target: <#T##Int#>) {
//                return Result(numbers: )
//            }
//        }
//        return nil
//    }
//    
//    private func genericApproach(depthStarted: Int, depthLeft: Int, resultSoFar: Result, numbersLeft: [Int], target: Int) -> Result? {
//        if depthLeft == 1 {
//            for k in (i + 1)..<numbers.count {
//        }
//    }
}
