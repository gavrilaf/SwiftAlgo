import Foundation

extension WeightedGraph  {
    
    public struct VertexPath: Equatable {
        public let vertex: V
        public let cost: Int
    }
    
    public func buildDijkstraPathes(from vertex: V) -> [VertexPath] {
        var distances = [V: VertexPath]()
        var settled = Set<V>()
        var heap = BinaryHeap<VertexPath> { $0.cost > $1.cost }
        
        allNodes.forEach {
            distances[$0.vertex] = VertexPath(vertex: $0.vertex, cost: Int.max)
        }
        
        distances[vertex] = VertexPath(vertex: vertex, cost: 0)
        
        heap.push(VertexPath(vertex: vertex, cost: 0))
        
        while settled.count != nodes.count {
            let current = heap.pop()! // TODO: refactoring
            settled.insert(current.vertex)
            
            // process all neighbours
            let currentNode = node(byVertex: current.vertex)
            currentNode?.edges.forEach { (vertex, edge) in
                if !settled.contains(vertex) {
                    let newDistance = current.cost + edge.weight
                    if newDistance < distances[vertex]!.cost {
                        distances[vertex] = VertexPath(vertex: vertex, cost: newDistance)
                    }
                    
                    heap.push(VertexPath(vertex: vertex, cost: newDistance))
                }
            }
        }
        
        return distances.values.map { $0 }
    }
}
