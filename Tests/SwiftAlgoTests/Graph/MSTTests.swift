import XCTest
@testable import SwiftAlgo

final class MSTTests: XCTestCase {
    
    struct TestCase {
        let edges: [(Int, Int, Int)]
        let cost: Int
    }
    
    let cases: [TestCase] = [
        TestCase(edges: [(1, 2, 1)], cost: 1),
        TestCase(edges: [(1, 2, 1), (2, 3, 2), (1, 3, 1)], cost: 2),
        TestCase(edges: [(1, 2, 1), (2, 4, 2), (3, 1, 4), (4, 3, 5), (4, 1, 3)], cost: 7),
        TestCase(edges: [(1, 2, 6), (1, 4, 5), (1, 5, 4), (2, 4, 1), (2, 5, 2), (2, 3, 5), (2, 6, 3), (3, 6, 4), (4, 5, 2), (5, 6, 4)], cost: 14),
    ]
    
    func testMSTPrim() {
        cases.forEach { (ts) in
            let gr = IntEdgeGraph<Int>(edges: ts.edges)
            let mst = gr.buildMSTPrim()
            let cost = mst.edgesCost
            
            XCTAssertEqual(cost, ts.cost)
        }
    }
}
