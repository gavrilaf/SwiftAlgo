import SwiftAlgo
import SwiftPerfTool

func runSCCBuilder(_ fn: String) {
    let graph = StaticEdgeGraph<Int>()
    
    print("readFile: \(fn)")
    let data = try! String(contentsOfFile: fn, encoding: .ascii)
    print("Splitting by lines")
    let lines = data.components(separatedBy: .newlines)
    
    lines.forEach { (line) in
        let s = line.trimmingCharacters(in: .whitespaces)
        if !s.isEmpty {
            //print("Line: \(s)")
            let row = s.components(separatedBy: .whitespaces).compactMap { return Int($0) }
            let start = row[0]
            let end = row[1]
            graph.addEdge(from: start, to: end)
        }
    }
    
    print("Vertexes count: \(graph.allNodes.count)")
    
    print("Build SCC")
    
    var scc: [[Int]]!
    let metrics = runMeasure(with: SPTConfig(iterations: 1, trials: [{ scc = graph.buildSCC() }] ))
    
    let counts = scc.map { return $0.count }.prefix(5)
    print("Done! SCC: \(counts)")
    print("Time = \(metrics.timeMean), scores = \(metrics.timeScores)")
}

func runDijkstraPath(_ fn: String) {
    let graph = IntEdgeGraph<Int>()
    
    print("readFile: \(fn)")
    let data = try! String(contentsOfFile: fn, encoding: .ascii)
    print("Splitting by lines")
    let lines = data.components(separatedBy: .newlines)
    
    /*
     Each row consists of the node tuples that are adjacent to that particular vertex along with the length of that edge.
     For example, the 6th row has 6 as the first entry indicating that this row corresponds to the vertex labeled 6.
     The next entry of this row "141,8200" indicates that there is an edge between vertex 6 and vertex 141 that has length 8200.
     The rest of the pairs of this row indicate the other vertices adjacent to vertex 6 and the lengths of the corresponding edges.
     */
    
    lines.forEach { (line) in
        let s = line.trimmingCharacters(in: .whitespaces)
        if !s.isEmpty {
            let components = s.components(separatedBy: .whitespaces)
            let from = Int(components[0])!
            
            for to in components[1...] {
                let toComponents = to.components(separatedBy: ",")
                let vTo = Int(toComponents[0])!
                let weight = Int(toComponents[1])!
                
                graph.addEdge(from: from, to: vTo, weight: weight)
            }
        }
    }
    
    //print("Vertexes count: \(graph.nodesCount)")
    print("Build Dijkstra path")
    
    /*
     You should report the shortest-path distances to the following ten vertices, in order:
     You should encode the distances as a comma-separated string of integers.
     */
    
    let pathes = graph.buildDijkstraPathes(from: 1).sorted { $0.vertex < $1.vertex }
    let expected = Set<Int>([7, 37, 59, 82, 99, 115, 133, 165, 188, 197])
    
    let pp: [String] = pathes.filter { expected.contains($0.vertex) }.map { String($0.cost) }

    print("Distances: \(pp.joined(separator: ","))")
}

func runMSTBuilder(_ fn: String) {
    let graph = IntEdgeGraph<Int>()
    
    print("readFile: \(fn)")
    let data = try! String(contentsOfFile: fn, encoding: .ascii)
    print("Splitting by lines")
    let lines = data.components(separatedBy: .newlines)
    
    lines[1...].forEach { (line) in
        let s = line.trimmingCharacters(in: .whitespaces)
        if !s.isEmpty {
            let components = s.components(separatedBy: .whitespaces)
            let from = Int(components[0])!
            let to = Int(components[1])!
            let weight = Int(components[2])!
            
            graph.addEdge(from: from, to: to, weight: weight)
        }
    }
    
    print("Vertexes count: \(graph.nodesCount)")
    print("Build MST using Prim's algo")
    
    let (_, cost) = graph.buildMSTPrim() // We don'ts care about tree, check only cost
    
    print("MST cost: \(cost)")
}


print("GraphRunner")

//runSCCBuilder("../../../test-data/scc/scc.txt")
//runSCCBuilder("../../../test-data/scc/test/input_mostlyCycles_65_320000.txt")

//runDijkstraPath("../../../test-data/dijkstra/test/input_random_1_4.txt")
//runDijkstraPath("../../../test-data/dijkstra/dijkstraData.txt")

runMSTBuilder("../../../test-data/mst-prim/test/input_random_1_10.txt")



