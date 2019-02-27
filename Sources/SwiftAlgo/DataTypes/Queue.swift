import Foundation

public struct Queue<T> {
    
    public init() {}
    
    public func push(_ t: T) {
        deq.pushLast(t)
    }
    
    @discardableResult
    public func pop() -> T? {
        return deq.popFirst()
    }
    
    public var head: T? {
        return deq.first
    }
    
    public var isEmpty: Bool {
        return deq.isEmpty
    }
    
    let deq = Dequeue<T>()
}

