//
//  LeetCode_Easy.swift
//  LeetCode
//
//  Created by William on 2023/1/18.
//

import Foundation

// MARK: - 測試用 (選項)
public extension LeetCode {
    
    class Easy: NSObject {
        
        public enum CodeName {
            case twoSum(numbers: [Int], target: Int)
            case isPalindrome(number: Int)
        }
        
        static public let shared = Easy()
        private override init() {}
    }
}

// MARK: - 簡單題 (測試)
public extension LeetCode.Easy {
    
    /// 題目測試
    func testCode(by codeName: LeetCode.Easy.CodeName) {
        
        switch codeName {
        case .twoSum(let numbers, let target): let result = LeetCode.shared.resultTest { twoSum(numbers: numbers, target: target) }; wwPrint(result)
        case .isPalindrome(let number): let result = LeetCode.shared.resultTest { isPalindrome(number: number) }; wwPrint(result)
        }
    }
}

// MARK: - 簡單題 (程式)
extension LeetCode.Easy {
    
    /// [001.兩數之和](https://leetcode.cn/problems/two-sum/)
    func twoSum(numbers: [Int], target: Int) -> [Int] {
        
        var indexArray: [Int] = []
        var dictionary: [Int: Int] = [:]
        
        for (index, number) in numbers.enumerated() {
            
            let result = target - number
            
            if let otherIndex = dictionary[number] { indexArray = [otherIndex, index]; break }
            dictionary[result] = index
        }
                
        return indexArray
    }
    
    /// [009.回文數](https://leetcode.cn/problems/palindrome-number/)
    func isPalindrome(number: Int) -> Bool {
        
        if (number < 0) { return false }
        
        let string = "\(number)"
        let isOdd = (string.count % 2 != 0) ? false : true
        let middleIndex = isOdd ? (string.count / 2) - 1 : (string.count / 2)
        
        let leftTextRange = 0...middleIndex
        let leftTextStart = string.index(string.startIndex, offsetBy: leftTextRange.lowerBound)
        let leftTextEnd = string.index(string.startIndex, offsetBy: leftTextRange.upperBound)
        let leftText = string[leftTextStart...leftTextEnd]
        
        let rightTextRange = isOdd ? (middleIndex + 1)...(string.count - 1) : middleIndex...(string.count - 1)
        let rightTextStart = string.index(string.startIndex, offsetBy: rightTextRange.lowerBound)
        let rightTextEnd = string.index(string.startIndex, offsetBy: rightTextRange.upperBound)
        let rightText = string[rightTextStart...rightTextEnd]
        
        if (leftText != String(rightText.reversed())) { return false }
        return true
    }
}
