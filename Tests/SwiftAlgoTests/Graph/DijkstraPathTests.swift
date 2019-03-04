import XCTest
@testable import SwiftAlgo

final class DijkstraPathTests: XCTestCase {
    
    func subjectAction(edges: [(Int, Int, Int)], from vertex:Int, expected: [(Int, Int)]) {
        let graph = IntEdgeGraph<Int>(edges: edges)
        
        let actualPathes = graph.buildDijkstraPathes(from: vertex).sorted { $0.vertex < $1.vertex }
        let expectedPathes = expected.map { return IntEdgeGraph<Int>.VertexPath(vertex: $0.0, cost: $0.1) }.sorted { $0.vertex < $1.vertex }
        
        XCTAssertEqual(actualPathes, expectedPathes)
    }
    
    
    func testDijkstraPath1() {
        let edges = [
            (1, 2, 1), (1, 8, 2),
            (2, 1, 1), (2, 3, 1),
            (3, 2, 1), (3, 4, 1),
            (4, 3, 1), (4, 5, 1),
            (5, 4, 1), (5, 6, 1),
            (6, 5, 1), (6, 7, 1),
            (7, 6, 1), (7, 8, 1),
            (8, 7, 1), (8, 1, 2),
        ]
        
        let expected = [
            (1, 0), // []
            (2, 1), // [2]
            (3, 2), // [2, 3]
            (4, 3), // [2, 3, 4]
            (5, 4), // [2, 3, 4, 5]
            (6, 4), // [8, 7, 6]
            (7, 3), // [8, 7]
            (8, 2),  // [8]
        ]
        
        subjectAction(edges: edges, from: 1, expected: expected)
    }
    
    func testDijkstraPath2() {
        let edges = [
            (0, 1, 9),
            (0, 2, 6),
            (0, 3, 5),
            (0, 4, 3),
            (2, 1, 2),
            (2, 3, 4)
        ]
        
        let expected = [
            (0, 0),
            (1, 8),
            (2, 6),
            (3, 5),
            (4, 3)
        ]
        
        subjectAction(edges: edges, from: 0, expected: expected)
    }
    
    static var allTests = [
        ("testDijkstraPath1", testDijkstraPath1),
        ("testDijkstraPath2", testDijkstraPath2),
    ]
}
