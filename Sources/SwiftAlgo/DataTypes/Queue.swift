import Foundation

public struct Queue<T> {
    private var buf = [T]()
    
    public init() {}
    
    public mutating func push(_ t: T) {
        buf.append(t)
    }
    
    @discardableResult
    public mutating func pop() -> T? {
        guard let p = buf.first else { return nil }
        
        buf.remove(at: 0)
        return p
    }
    
    public var head: T? {
        return buf.first
    }
    
    public var isEmpty: Bool {
        return buf.isEmpty
    }
}
