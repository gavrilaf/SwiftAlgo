import Foundation

extension Graph {
    public func copy() -> Graph {
        let cp = Graph()
        
        nodes.values.forEach { (node) in
            node.edges.forEach { (edge) in
                cp.addEdge(from: node.vertex, to: edge.end.vertex, edge: edge.edge)
            }
        }
        
        return cp
    }
    
    public func reverseCopy() -> Graph {
        let reversed = Graph()
        
        nodes.values.forEach { (node) in
            node.edges.forEach { (edge) in
                reversed.addEdge(from: edge.end.vertex, to: node.vertex, edge: edge.edge)
            }
        }
        
        return reversed
    }
}
