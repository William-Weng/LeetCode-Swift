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
            case none
        }
        
        static public let shared = Hard()
        private override init() {}
    }
}

// MARK: - 簡單題 (測試)
public extension LeetCode.Hard {
    
    /// 題目測試
    func testCode(by codeName: LeetCode.Hard.CodeName) {
        
        switch codeName {
        case .none: let result = LeetCode.shared.resultTest { none() }; wwPrint(result)
        }
    }
}

// MARK: - 簡單題 (困難)
extension LeetCode.Hard {
    
    func none() -> String { return "太難了" }
}
