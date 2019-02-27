import Foundation

extension Graph {
    public func buildSCC() -> [[V]] {
        // Find travesal order
        func findTraversalOrder() -> Stack<V> {
            var orderStack = Stack<V>()
            var colors = Dictionary<V, Int>()
            
            func fillOrder(_ node: NodeT) {
                let stack = Stack<NodeT>()
                stack.push(node)
                
                while let current = stack.top {
                    if let color = colors[current.vertex] { // already seen
                        stack.pop()
                        if color == 1 {
                            orderStack.push(current.vertex)
                            colors[current.vertex] = 2
                        }
                    } else { // first time seen
                        colors[current.vertex] = 1
                        current.edges.forEach { (edge) in
                            if !colors.keys.contains(edge.end.vertex) {
                                stack.push(edge.end)
                            }
                        }
                    }
                }
            }
            
            nodes.values.forEach { (node) in
                fillOrder(node)
            }
            
            return orderStack
        }
        
        var traversalOrder = findTraversalOrder()
        
        // Build reversed graph
        let reversed = reverseCopy()
        
        // And finally find SCC
        func findSCC() -> [[V]] {
            var result = [[V]]()
            var visited = Set<V>()
            
            func dfsUtil(_ v: V, scc: inout [V]) {
                let stack = Stack<NodeT>()
                
                if let node = reversed.node(byVertex: v) {
                    stack.push(node)
                }
                
                while let current = stack.pop() {
                    if !visited.contains(current.vertex) {
                        visited.insert(current.vertex)
                        scc.append(current.vertex)
                    }
                    
                    current.edges.forEach { (edge) in
                        if !visited.contains(edge.end.vertex) {
                            stack.push(edge.end)
                        }
                    }
                }
            }
            
            while let vertex = traversalOrder.pop() {
                if !visited.contains(vertex) {
                    var scc = [V]()
                    dfsUtil(vertex, scc: &scc)
                    
                    if scc.count > 0 {
                        result.append(scc)
                    }
                }
            }
            
            return result
        }
        
        let res = findSCC().sorted { return $0.count > $1.count }
        return res
    }
}
