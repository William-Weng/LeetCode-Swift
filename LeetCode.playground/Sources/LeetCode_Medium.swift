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
            case maxArea(heights: [Int])
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
        case .maxArea(let heights): let result = LeetCode.shared.resultTest { maxArea(heights: heights) }; wwPrint(result)
        }
    }
}

// MARK: - 中等題 (程式)
extension LeetCode.Medium {
    
    /// [007.整數反轉](https://leetcode.cn/problems/reverse-integer/)
    func reverse(number: Int) -> Int {
        
        let isNegative = number < 0
        let _number = !isNegative ? number : -number
        
        guard var reverseNumber = Int(String("\(_number)".reversed())) else { return 0 }
        reverseNumber = !isNegative ? reverseNumber : -reverseNumber
        
        if (reverseNumber < Int32.min) { return 0 }
        if (reverseNumber > Int32.max) { return 0 }
        
        return reverseNumber
    }
    
    /// [011.盛最多水的容器 => 不能漏水](https://leetcode-cn.com/problems/container-with-most-water/)
    func maxArea(heights: [Int]) -> Int {
        
        var index = (start: 0, end: heights.count - 1)
        var area = (width: 0, height: 0, max: 0)
        
        while (index.end > index.start) {
            
            area.width = index.end - index.start
            
            if (heights[index.start] < heights[index.end]) {
                area.height = heights[index.start]
                index.start += 1
            } else {
                area.height = heights[index.end]
                index.end -= 1
            }
            
            let _area = area.width * area.height
            if (_area > area.max) { area.max = _area }
        }
        
        return area.max
    }
}
