import Foundation

// MARK: -
public protocol VertexProtocol: Hashable {}

public protocol EdgeProtocol: Hashable {}

// MARK: -
public class Graph<V: VertexProtocol, E: EdgeProtocol> {
    
    public init() {}
    
    public convenience init(edges: [(V, V, E)]) {
        self.init()
        
        edges.forEach {
            addEdge(from: $0.0, to: $0.1, edge: $0.2)
        }
    }
    
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

extension Graph: Equatable {
    public static func == (lhs: Graph, rhs: Graph) -> Bool {
        return lhs.allNodes == rhs.allNodes
    }
}

// MARK: -
extension Int: VertexProtocol {}

// MARK: -
public struct StaticEdge: EdgeProtocol {
    public static func == (lhs: StaticEdge, rhs: StaticEdge) -> Bool { return true }
}

public class StaticEdgeGraph<V: VertexProtocol>: Graph<V, StaticEdge> {
    public override init() {
        super.init()
    }
    
    public convenience init(edges: [(V, V)]) {
        self.init()
        
        edges.forEach {
            addEdge(from: $0.0, to: $0.1)
        }
    }
    
    public func addEdge(from: V, to: V) {
        addEdge(from: from, to: to, edge: StaticEdge())
    }
}
