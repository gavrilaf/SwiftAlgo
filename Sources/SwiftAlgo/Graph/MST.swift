import Foundation

extension WeightedGraph  {
    
    struct Edge_ {
        let start: V
        let end: V
        let edge: E
    }
    
    
    public func buildMSTPrim() -> (mst: WeightedGraph<V, E>, cost: Int) {
        let mst = WeightedGraph<V, E>()
        var cost = 0
        
        guard let start = first else {
            return (mst: mst, cost: 0) // return empty MST for the empty graph
        }
        
        var heap = BinaryHeap<Edge_> { $0.edge.weight > $1.edge.weight }
        var visited = Set<V>()
        
        start.edges.forEach { (arg) in
            let (vertex, edge) = arg
            heap.push(Edge_(start: start.vertex, end: vertex, edge: edge))
        }
        
        visited.insert(start.vertex)
        
        while let head = heap.pop() {
            if visited.contains(head.end) {
                continue
            }
            
            visited.insert(head.end)
            
            mst.addEdge(from: head.start, to: head.end, edge: head.edge)
            cost += head.edge.weight
            
            let node = self.node(byVertex: head.end)
            node?.edges.forEach { (arg) in
                let (vertex, edge) = arg
                heap.push(Edge_(start: head.end, end: vertex, edge: edge))
            }
        }
        
        return (mst: mst, cost: cost)
    }
}
