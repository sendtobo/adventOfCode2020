//
//  Day13Tests.swift
//  AdventOfCode2020
//
//  Created by Bo Oelkers on 11/29/20.
//

import XCTest
import AdventOfCode2020

final class Day13Tests: XCTestCase {
	private let test = Day13()
	func testFirst() throws {
		let proposedSolution = test.runProblem(.first, solution: test.first(_:))
		print(proposedSolution)
	}
	
	func testSecond() throws {
		let proposedSolution = test.runProblem(.second, solution: test.second(_:))
		print(proposedSolution)
	}
	
	static var allTests = [
		("testFirst", testFirst),
		("testSecond", testSecond)
	]
}
