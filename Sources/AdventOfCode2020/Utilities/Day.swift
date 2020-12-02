//
//  File.swift
//  2020
//
//  Created by Bo Oelkers on 11/28/20.
//
import Files

public enum Problem: String {
    case first = "1"
    case second = "2"
}

public protocol Day {
    var name: String { get }
    init()
    func first(_ input: String) -> CustomStringConvertible
    func second(_ input: String) -> CustomStringConvertible
}

public extension Day {
    func runProblem(_ problem: Problem, solution: (String) -> CustomStringConvertible) -> String {
        let inputFolder = try! Folder(path: "./")
        var inputFile: File
        do {
            inputFile = try inputFolder.file(at: "input\(name)-\(problem.rawValue).txt")
        } catch {
            // Assume we always have at least input
            inputFile = try! inputFolder.file(at: "input\(name).txt")
        }
        // If there isnt a string here we are dead
        return "\(solution(try! inputFile.readAsString()))"
    }
}
