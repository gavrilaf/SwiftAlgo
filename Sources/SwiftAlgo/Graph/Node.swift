import Foundation

public class Node<V: VertexProtocol, E: EdgeProtocol> {
    
    // MARK: -
    public struct AdjacentSequence: Sequence, IteratorProtocol {
        public mutating func next() -> Node? {
            return it.next()?.end
        }
        
        init(_ adjs: [Adjacent]) { it = adjs.makeIterator() }
        var it: IndexingIterator<Array<Adjacent>>
    }
    
    public struct EdgesSequence: Sequence, IteratorProtocol {
        public mutating func next() -> (V, E)? {
            return it.next().flatMap { (edge) -> (V, E)? in return (edge.end.vertex, edge.edge) }
        }
        
        init(_ adjs: [Adjacent]) { it = adjs.makeIterator() }
        var it: IndexingIterator<Array<Adjacent>>
    }
    
    // MARK: -
    public var adjacents: AdjacentSequence {
        return AdjacentSequence(adjs)
    }
    
    public var edges: EdgesSequence {
        return EdgesSequence(adjs)
    }
    
    public let vertex: V
    
    // MARK: -
    init(vertex: V) {
        self.vertex = vertex
    }
    
    func addEdge(to node: Node<V, E>, edge: E) {
        adjs.append(Adjacent(edge: edge, end: node))
    }
    
    // MARK: - private
    struct Adjacent: Hashable {
        let edge: E
        let end: Node
        
        public func hash(into hasher: inout Hasher) {
            hasher.combine(end.vertex)
            hasher.combine(edge)
        }
    }
    
    var adjs = [Adjacent]()
}

extension Node: Hashable {
    public var hashValue: Int {
        return vertex.hashValue
    }
}

extension Node: Equatable {
    public static func == (lhs: Node<V, E>, rhs: Node<V, E>) -> Bool {
        if lhs.vertex == rhs.vertex {
            let lhsAdjs = Set<Int>(lhs.adjs.map { return $0.hashValue })
            let rhsAdjs = Set<Int>(rhs.adjs.map { return $0.hashValue })
            return lhsAdjs == rhsAdjs
        }
        
        return false
    }
}

extension Node: CustomStringConvertible {
    public var description: String {
        return "Node(vertex: \(vertex))"
    }
}

