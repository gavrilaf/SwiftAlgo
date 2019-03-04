import Foundation

extension Graph {
    public func copy() -> Graph {
        let cp = Graph()
        
        nodes.values.forEach { (node) in
            node.edges.forEach { (to, edge) in
                cp.addEdge(from: node.vertex, to: to, edge: edge)
            }
        }
        
        return cp
    }
    
    public func reverseCopy() -> Graph {
        let reversed = Graph()
        
        nodes.values.forEach { (node) in
            node.edges.forEach { (to, edge) in
                reversed.addEdge(from: to, to: node.vertex, edge: edge)
            }
        }
        
        return reversed
    }
}
