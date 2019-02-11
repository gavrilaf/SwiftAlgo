import Foundation

public struct Stack<T> {
    private var buf = [T]()
    
    public init() {}
    
    public mutating func push(_ t: T) {
        buf.insert(t, at: 0)
    }
    
    @discardableResult
    public mutating func pop() -> T? {
        guard let p = buf.first else { return nil }
        
        buf.remove(at: 0)
        return p
    }
    
    public var top: T? {
        return buf.first
    }
    
    public var isEmpty: Bool {
        return buf.isEmpty
    }
}
