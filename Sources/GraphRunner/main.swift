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
    
    print("Vertexes count: \(graph.allNodes.count)")
    print("Build Dijkstra path")
}

print("GraphRunner")

//runSCCBuilder("../../../test-data/scc/scc.txt")
//runSCCBuilder("../../../test-data/scc/test/input_mostlyCycles_65_320000.txt")

runDijkstraPath("../../../test-data/dijkstra/test/input_random_1_4.txt")



