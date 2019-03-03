import Foundation

public protocol WeightedEdgeProtocol: EdgeProtocol {
    var weight: Int { get }
}

public class WeightedGraph<V: VertexProtocol, E: WeightedEdgeProtocol>: Graph<V, E> {

}

// MARK: -
extension Int: WeightedEdgeProtocol {
    public var weight: Int { return self }
}

public class IntEdgeGraph<V: VertexProtocol>: WeightedGraph<V, Int> {
    public override init() {
        super.init()
    }
    
    public convenience init(edges: [(V, V, Int)]) {
        self.init()
        
        edges.forEach {
            addEdge(from: $0.0, to: $0.1, weight: $0.2)
        }
    }
    
    public func addEdge(from: V, to: V, weight: Int) {
        addEdge(from: from, to: to, edge: weight)
    }
}
