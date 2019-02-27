import Foundation

public struct Stack<T> {
    
    public init() {}
    
    public func push(_ t: T) {
        deq.pushFirst(t)
    }
    
    @discardableResult
    public func pop() -> T? {
        return deq.popFirst()
    }
    
    public var top: T? {
        return deq.first
    }

    public var isEmpty: Bool {
        return deq.isEmpty
    }
    
    let deq = Dequeue<T>()
}

extension Stack: CustomStringConvertible {
    public var description: String {
        return "Stack[\(self.deq.toString())]"
    }
}
