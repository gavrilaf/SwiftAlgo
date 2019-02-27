import XCTest
@testable import SwiftAlgo

final class GraphSCCTests: XCTestCase {
    
    func testSCC1() {
        let g = StaticEdgeGraph<Int>(edges: [(1, 2), (2, 8), (3, 1), (4, 7), (5, 6), (6, 5), (7, 4), (8, 3)])
        
        let scc = g.buildSCC().map { return $0.count }
        XCTAssertEqual(scc, [4, 2, 2])
    }
    
    func testSCC2() {
        let g = StaticEdgeGraph<Int>(edges: [(1, 7), (2, 1), (3, 8), (4, 6), (5, 3), (6, 2), (7, 5), (8, 4)])
        
        let scc = g.buildSCC().map { return $0.count }
        XCTAssertEqual(scc, [8])
    }
    
    func testSCC3() {
        let g = StaticEdgeGraph<Int>(edges: [(1, 18), (2, 3), (3, 31), (4, 9), (5, 24), (6, 22), (7, 29), (8, 7), (9, 15), (10, 4), (11, 12),
                                             (12, 8), (13, 28), (15, 32), (16, 23), (17, 30), (18, 27), (19, 1), (20, 19), (21, 26), (22, 10),
                                             (23, 13), (24, 5), (25, 2), (26, 16), (27, 25), (28, 21), (29, 20), (30, 6), (31, 11), (32, 17)])
        
        let scc = g.buildSCC().map { return $0.count }
        XCTAssertEqual(scc, [14, 9, 6, 2])
    }
    
    func testSCC4() {
        let g = StaticEdgeGraph<Int>(edges: [(1, 2), (2, 3), (3, 4), (4, 2), (5, 2), (5, 6)])
        
        let scc = g.buildSCC().map { return $0.count }
        XCTAssertEqual(scc, [3, 1, 1, 1])
    }
    
    func testSCC5() {
        let g = StaticEdgeGraph<Int>(edges: [(1, 0), (0, 2), (2, 1), (0, 3), (3, 4)])
        
        let scc = g.buildSCC().map { return $0.count }
        XCTAssertEqual(scc, [3, 1, 1])
    }
}
