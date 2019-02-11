import Foundation

// MARK: -
public protocol VertexProtocol: Hashable {}

public protocol EdgeProtocol {}

// MARK: -
public class Graph<V: VertexProtocol, E: EdgeProtocol> {
    
    public init() {}
    
    public func addEdge(from: V, to: V, edge: E) {
        let start: NodeT
        let end: NodeT
        
        if let node = nodes[from.hashValue] {
            start = node
        } else {
            start = NodeT(vertex: from)
            nodes[from.hashValue] = start
        }
        
        if let node = nodes[to.hashValue] {
            end = node
        } else {
            end = NodeT(vertex: to)
            nodes[to.hashValue] = end
        }
        
        start.addEdge(to: end, edge: edge)
    }
    
    // MARK: -
    public var first: Node<V, E>? {
        return nodes.first?.value
    }
    
    public var allNodes: Set<Node<V, E>> {
        return Set(nodes.values)
    }
    
    public func node(byVertex vertex: V) -> Node<V, E>? {
        return nodes[vertex.hashValue]
    }
    
    // MARK: -
    typealias NodeT = Node<V, E>
    typealias NodesDict = Dictionary<Int, NodeT>
    
    var nodes = NodesDict()
}

// MARK: -
extension Int: VertexProtocol {}

public struct StaticEdge: EdgeProtocol {}

public class StaticEdgeGraph<V: VertexProtocol>: Graph<V, StaticEdge> {
    public override init() {
        super.init()
    }
    
    public func addEdge(from: V, to: V) {
        addEdge(from: from, to: to, edge: StaticEdge())
    }
}
