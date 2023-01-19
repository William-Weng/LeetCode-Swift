import Foundation

public class ListNode<T> {
    
    var value: T
    var next: ListNode?
    
    init(_ value: T, next: ListNode?) {
        self.value = value
        self.next = next
    }
    
    public static func build(by values: [T]) -> ListNode? {
     
        if (values.isEmpty) { return nil }
        
        var _values = values
        let value = _values.popLast()
        
        wwPrint(value)
        
        return nil
    }
}
