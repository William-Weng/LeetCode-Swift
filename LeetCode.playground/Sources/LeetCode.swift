//
//  LeetCode.swift
//  LeetCode
//
//  Created by William on 2023/1/18.
//

import Foundation

// MARK: - 自定義的Print
public func wwPrint<T>(_ msg: T, file: String = #file, method: String = #function, line: Int = #line) {
    Swift.print("🚩 \((file as NSString).lastPathComponent)：\(line) - \(method) \t✅ \(msg)")
}

// MARK: - [LeetCode (單例)](https://www.liwenzhou.com/posts/Go/LeetCode/)
public class LeetCode: NSObject {
    
    static let shared = LeetCode()
    private override init() {}
}

// MARK: - 小工具
extension LeetCode {
    
    /// [計算結果與時間](https://github.com/halfrost/LeetCode-Go)
    func resultTest<T>(action: () -> T) -> (result: T, timeInterval: TimeInterval) {
        
        let startTime = Date().timeIntervalSinceNow
        let result = action()
        let endTime = Date().timeIntervalSinceNow
        
        return (result, endTime - startTime)
    }
}


