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
            case removeDuplicates(numbers: [Int])
            case longestCommonPrefix(strings: [String])
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
        case .removeDuplicates(let numbers): let result = LeetCode.shared.resultTest { removeDuplicates(numbers: numbers) }; wwPrint(result)
        case .longestCommonPrefix(let strings): let result = LeetCode.shared.resultTest { longestCommonPrefix(strings: strings) }; wwPrint(result)
        }
    }
}

// MARK: - 簡單題 (程式)
extension LeetCode.Easy {
    
    /// [0001.兩數之和](https://leetcode.cn/problems/two-sum/)
    /// => LeetCode.Easy.shared.testCode(by: .twoSum(numbers: [2, 7, 11, 15], target: 9))
    /// => LeetCode.Easy.shared.testCode(by: .twoSum(numbers: [3, 2, 4], target: 6))
    /// => LeetCode.Easy.shared.testCode(by: .twoSum(numbers: [3, 3], target: 6))
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
    
    /// [0009.回文數](https://leetcode.cn/problems/palindrome-number/)
    /// => LeetCode.Easy.shared.testCode(by: .isPalindrome(number: 1000))
    /// => LeetCode.Easy.shared.testCode(by: .isPalindrome(number: 123454321))
    /// => LeetCode.Easy.shared.testCode(by: .isPalindrome(number: 9876556789))
    func isPalindrome(number: Int) -> Bool {
        
        if (number < 0) { return false }
        
        let string = "\(number)"
        let isOdd = (string.count % 2 != 0) ? false : true
        let middleIndex = isOdd ? (string.count / 2) - 1 : (string.count / 2)
        
        let leftTextRange = 0...middleIndex
        let leftTextIndex = (
            start: string.index(string.startIndex, offsetBy: leftTextRange.lowerBound),
            end: string.index(string.startIndex, offsetBy: leftTextRange.upperBound)
        )
        
        let leftText = string[leftTextIndex.start...leftTextIndex.end]
        
        let rightTextRange = isOdd ? (middleIndex + 1)...(string.count - 1) : middleIndex...(string.count - 1)
        let rightTextIndex = (
            start: string.index(string.startIndex, offsetBy: rightTextRange.lowerBound),
            end: string.index(string.startIndex, offsetBy: rightTextRange.upperBound)
        )
        
        let rightText = string[rightTextIndex.start...rightTextIndex.end]
        
        if (leftText != String(rightText.reversed())) { return false }
        return true
    }
    
    /// [0014.最長公共前綴](https://leetcode.cn/problems/longest-common-prefix/)
    /// => LeetCode.Easy.shared.testCode(by: .longestCommonPrefix(strings: ["flower", "flow", "flight"]))
    /// => LeetCode.Easy.shared.testCode(by: .longestCommonPrefix(strings: ["dog", "racecar", "car"]))
    /// => LeetCode.Easy.shared.testCode(by: .longestCommonPrefix(strings: ["flower", "flow", "first"]))
    func longestCommonPrefix(strings: [String]) -> String {
        
        guard !strings.isEmpty else { return "" }
        
        var shortestString = (text: "", count: Int.max)
        var prefixArray: [String] = []
        
        strings.forEach { string in
            if (shortestString.count > string.count) { shortestString = (string, string.count) }
        }
        
        for character in shortestString.text {
            
            prefixArray.append(String(character))
            
            let prefixString = prefixArray.joined(separator: "")
            var hasPrefix = false
            
            for string in strings {
                hasPrefix = string.hasPrefix(prefixString)
                if (!hasPrefix) { prefixArray.removeLast(); break }
            }
            
            if (!hasPrefix) { break }
        }
        
        return prefixArray.joined(separator: "")
    }
    
    /// [0026.刪除有序陣列中的重複項](https://leetcode.cn/problems/remove-duplicates-from-sorted-array/)
    /// => LeetCode.Easy.shared.testCode(by: .removeDuplicates(numbers: [1, 1, 2]))
    /// => LeetCode.Easy.shared.testCode(by: .removeDuplicates(numbers: [0, 0, 1, 1, 1, 2, 2, 3, 3, 4]))
    /// => LeetCode.Easy.shared.testCode(by: .removeDuplicates(numbers: [4, 4, 5, 3, 3, 1, 5, 2, 2, 0]))
    func removeDuplicates(numbers: [Int]) -> [Int] {
        let set = Set(numbers)
        let newNumbers = Array(set).sorted()
        return newNumbers
    }
}
