//
//  LeetCode_Medium.swift
//  LeetCode
//
//  Created by William on 2023/1/18.
//

import Foundation

// MARK: - 測試用 (選項)
public extension LeetCode {
    
    class Medium: NSObject {
        
        public enum CodeName {
            case reverse(number: Int)
        }
        
        static public let shared = Medium()
        private override init() {}
    }
}

// MARK: - 中等題 (測試)
public extension LeetCode.Medium {
    
    /// 題目測試
    func testCode(by codeName: LeetCode.Medium.CodeName) {
        
        switch codeName {
        case .reverse(let number): let result = LeetCode.shared.resultTest { reverse(number: number) }; wwPrint(result)
        }
    }
}

// MARK: - 中等題 (程式)
extension LeetCode.Medium {
    
    /// [007.整數反轉](https://leetcode.cn/problems/reverse-integer/)
    func reverse(number: Int) -> Int {
        
        guard let string = Optional.some(String("\(number)".reversed())),
              let reverseNumber = Int(string)
        else {
            return 0
        }

        if (reverseNumber < Int32.min) { return 0 }
        if (reverseNumber > Int32.max) { return 0 }
        
        return reverseNumber
    }
}
