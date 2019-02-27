import SwiftAlgo
import SwiftPerfTool

func readEdgesFile(_ fn: String) -> StaticEdgeGraph<Int> {
    let graph = StaticEdgeGraph<Int>()
    
    print("readEdgesFile: \(fn)")
    print("Open file")
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
    
    return graph
}

print("GraphRunner")

let gr = readEdgesFile("../../../test-data/scc.txt")
//let gr = readEdgesFile("../../../test-data/input_mostlyCycles_65_320000.txt")
print("Vertexes count: \(gr.allNodes.count)")

print("Build SCC")

var scc: [[Int]]!
let metrics = runMeasure(with: SPTConfig(iterations: 1, trials: [{ scc = gr.buildSCC() }] ))

let counts = scc.map { return $0.count }.prefix(5)
print("Done! SCC: \(counts)")


print("Time = \(metrics.timeMean), scores = \(metrics.timeScores)")



