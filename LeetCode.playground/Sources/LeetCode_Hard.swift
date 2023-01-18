//
//  LeetCode_Hard.swift
//  LeetCode
//
//  Created by William on 2023/1/18.
//

import Foundation

// MARK: - 測試用 (選項)
public extension LeetCode {
    
    class Hard: NSObject {
        
        public enum CodeName {
            case medianSortedArrays(array1: [Int], array2: [Int])
        }
        
        static public let shared = Hard()
        private override init() {}
    }
}

// MARK: - 困難題 (測試)
public extension LeetCode.Hard {
    
    /// 題目測試
    func testCode(by codeName: LeetCode.Hard.CodeName) {
        
        switch codeName {
        case .medianSortedArrays(let array1, let array2): let result = LeetCode.shared.resultTest { medianSortedArrays(array1: array1, array2: array2) }; wwPrint(result)
        }
    }
}

// MARK: - 困難題 (程式)
extension LeetCode.Hard {
    
    /// [尋找兩個正序陣列的中位數 => 時間複雜度：O(log(m+n))](https://leetcode.cn/problems/median-of-two-sorted-arrays/)
    func medianSortedArrays(array1: [Int], array2: [Int]) -> Double {
        fatalError()
    }
}
