//
//  String+Utilities.swift
//  AdventOfCode2020
//
//  Created by Bo Oelkers on 11/30/20.
//

import Foundation

extension String {
    var splitByNewLine: [String] {
        self.split(separator: "\n").map({ String($0) })
    }
    
    var splitByNewLineInts: [Int] {
        self.splitByNewLine.map({ Int($0)! })
    }
    
    var splitByNewLineDoubles: [Double] {
        self.splitByNewLine.map({ Double($0)! })
    }

    subscript(_ index: Int) -> String? {
        let realIndex = self.index(self.startIndex, offsetBy: index)
        guard realIndex < self.endIndex else { return nil }
        return String(self[realIndex])
    }
}
