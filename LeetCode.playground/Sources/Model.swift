import Foundation

protocol ListNodeValueProtocol {
   associatedtype ListNodeValueType
   var value: ListNodeValueType { get set }
}

public class ListNode<T>: ListNodeValueProtocol {
    
    public var value: Any
    public var next: ListNode?
    
    public init<T>(_ value: T, next: ListNode?) {
        self.value = value
        self.next = next
    }
}
