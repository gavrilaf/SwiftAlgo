import Foundation

// MARK: - Breadth-first search
public class BFS<V: VertexProtocol, E: EdgeProtocol> : Sequence, IteratorProtocol {
    
    public init(graph: Graph<V, E>, start: V) {
        self.graph = graph
        
        if let node = graph.nodes[start.hashValue] {
            visited.insert(start)
            queue.push(node)
        }
    }
    
    public func next() -> V? {
        guard let current = queue.pop() else { return nil }
        
        current.edges.forEach { (edge) in
            if !visited.contains(edge.end.vertex) {
                visited.insert(edge.end.vertex)
                queue.push(edge.end)
            }
        }
        
        return current.vertex
    }
    
    // MARK: -
    private let graph: Graph<V, E>
    
    private var visited = Set<V>()
    private var queue = Queue<Graph<V, E>.NodeT>()
}

// MARK: - Depth-first search
public class DFS<V: VertexProtocol, E: EdgeProtocol> : Sequence, IteratorProtocol {
    
    public init(graph: Graph<V, E>, start: V) {
        self.graph = graph
        
        if let node = graph.nodes[start.hashValue] {
            stack.push(node)
        }
    }
    
    public func next() -> V? {
        while let current = stack.pop() {
            if visited.contains(current.vertex) {
                continue
            }
            
            current.edges.reversed().forEach { (edge) in
                if !visited.contains(edge.end.vertex) {
                    stack.push(edge.end)
                }
            }
            
            visited.insert(current.vertex)
            return current.vertex
        }
        
        return nil
    }
    
    // MARK: -
    private let graph: Graph<V, E>
    
    private var visited = Set<V>()
    private var stack = Stack<Graph<V, E>.NodeT>()
}
