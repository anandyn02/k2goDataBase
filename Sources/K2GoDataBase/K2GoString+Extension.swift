//
//  File.swift
//  
//
//  Created by Anand  on 11/11/23.
//

import Foundation

public extension String {
    
    func k2GoSpotSearchText(_ text: String) -> String? {
        guard let leftRange = range(of: text) else {
            return nil
        }
        
        let offset: Int = 50
        
        let startIndex = self.distance(from: self.startIndex, to: leftRange.lowerBound)
        var endIndex = self.distance(from: self.startIndex, to: self.endIndex)
        
        if (endIndex - startIndex) > offset {
            endIndex -= offset
        }
        else {
            endIndex = (endIndex - (startIndex + text.count))
        }
        
        let start = self.index(leftRange.lowerBound, offsetBy: -((startIndex > offset) ? offset: startIndex))
        let end = self.index(leftRange.lowerBound, offsetBy: ((endIndex > offset) ? offset : endIndex))

        var result = self[start...end]
        
        if let range = result.range(of:">") {
            result = result[range.upperBound...]
            if let rng = result.range(of: "<", options: .backwards) {
                result = result[...rng.lowerBound].dropLast()
            }
         }

        return "\(result)"
    }
    
    //right is the first encountered string after left
    func k2GoBetween(_ left: String, _ right: String) -> String? {
        guard
            let leftRange = range(of: left), let rightRange = range(of: right, options: .backwards)
            , leftRange.upperBound <= rightRange.lowerBound
            else { return nil }
        
        let sub = self[leftRange.upperBound...]
        let closestToLeftRange = sub.range(of: right)!
        return String(sub[..<closestToLeftRange.lowerBound])
    }
    
    var k2GoLength: Int {
        get {
            return self.count
        }
    }
    
    func k2GoSubstring(to : Int) -> String {
        let toIndex = self.index(self.startIndex, offsetBy: to)
        return String(self[...toIndex])
    }
    
    func k2GoSubstring(from : Int) -> String {
        let fromIndex = self.index(self.startIndex, offsetBy: from)
        return String(self[fromIndex...])
    }
    
    func k2GoSubstring(_ r: Range<Int>) -> String {
        let fromIndex = self.index(self.startIndex, offsetBy: r.lowerBound)
        let toIndex = self.index(self.startIndex, offsetBy: r.upperBound)
        let indexRange = Range<String.Index>(uncheckedBounds: (lower: fromIndex, upper: toIndex))
        return String(self[indexRange])
    }
    
    func k2GoCharacter(_ at: Int) -> Character {
        return self[self.index(self.startIndex, offsetBy: at)]
    }
    
    func k2GoLastIndexOfCharacter(_ c: Character) -> Int? {
        guard let index = range(of: String(c), options: .backwards)?.lowerBound else
        { return nil }
        return distance(from: startIndex, to: index)
    }
}
