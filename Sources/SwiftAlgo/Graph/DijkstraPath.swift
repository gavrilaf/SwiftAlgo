import Foundation

extension WeightedGraph  {
    
    public struct VertexPath {
        let vertex: V
        let cost: Int
    }
    
    public func buildDijkstraPathes(from vertex: V) -> Dictionary<V, Int> {
        var distances = [V: Int]()
        var settled = Set<V>()
        var heap = BinaryHeap<VertexPath> { $0.cost > $1.cost }
        
        allNodes.forEach {
            distances[$0.vertex] = Int.max
        }
        
        distances[vertex] = 0
        
        heap.push(VertexPath(vertex: vertex, cost: 0))
        
        while settled.count != nodes.count {
            let current = heap.pop()! // TODO: refactoring
            settled.insert(current.vertex)
            
            // process all neighbours
            let currentNode = node(byVertex: current.vertex)
            currentNode?.edges.forEach { (neighbour) in
                if !settled.contains(neighbour.end.vertex) {
                    let newDistance = current.cost + neighbour.edge.weight
                    if newDistance < distances[neighbour.end.vertex]! {
                        distances[neighbour.end.vertex] = newDistance
                    }
                    
                    heap.push(VertexPath(vertex: neighbour.end.vertex, cost: distances[neighbour.end.vertex]!))
                }
            }
        }
        
        return distances
    }
}
