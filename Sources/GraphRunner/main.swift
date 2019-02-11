import SwiftAlgo


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

print("Vertexes count: \(gr.allNodes.count)")
