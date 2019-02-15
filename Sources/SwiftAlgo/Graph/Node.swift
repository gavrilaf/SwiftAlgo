import Foundation

public class Node<V: VertexProtocol, E: EdgeProtocol> {
    
    // MARK: -
    public struct AdjacentSequence: Sequence, IteratorProtocol {
        public mutating func next() -> Node<V, E>? {
            return it.next()?.end
        }
        
        init(_ edges: [Edge]) { it = edges.makeIterator() }
        var it: IndexingIterator<Array<Edge>>
    }
    
    public var adjacents: Node<V, E>.AdjacentSequence {
        return AdjacentSequence(edges)
    }
    
    public let vertex: V
    
    // MARK: -
    init(vertex: V) {
        self.vertex = vertex
    }
    
    func addEdge(to node: Node<V, E>, edge: E) {
        edges.append(Edge(edge: edge, end: node))
    }
    
    struct Edge: Hashable {
        let edge: E
        let end: Node
        
        public func hash(into hasher: inout Hasher) {
            hasher.combine(end.vertex)
            hasher.combine(edge)
        }
    }
    
    // MARK:
    var edges = [Edge]()
}

extension Node: Hashable {
    public var hashValue: Int {
        return vertex.hashValue
    }
}

extension Node: Equatable {
    public static func == (lhs: Node<V, E>, rhs: Node<V, E>) -> Bool {
        if lhs.vertex == rhs.vertex {
            let lhsEdges = Set<Int>(lhs.edges.map { return $0.hashValue })
            let rhsEdges = Set<Int>(rhs.edges.map { return $0.hashValue })
            return lhsEdges == rhsEdges
        }
        
        return false
    }
}

extension Node: CustomStringConvertible {
    public var description: String {
        return "Node(vertex: \(vertex))"
    }
}

