import XCTest
@testable import SwiftAlgo

final class DijkstraPathTests: XCTestCase {
    
    func testDijkstraPath() {
        let g = IntEdgeGraph<Int>(edges: [
            (1, 2, 1), (1, 8, 2),
            (2, 1, 1), (2, 3, 1),
            (3, 2, 1), (3, 4, 1),
            (4, 3, 1), (4, 5, 1),
            (5, 4, 1), (5, 6, 1),
            (6, 5, 1), (6, 7, 1),
            (7, 6, 1), (7, 8, 1),
            (8, 7, 1), (8, 1, 2),
        ])
        
        let actual = g.buildDijkstraPathes(from: 1)
        
        let expected: [Int: Int] = [
            1 : 0, // []
            2 : 1, // [2]
            3 : 2, // [2, 3]
            4 : 3, // [2, 3, 4]
            5 : 4, // [2, 3, 4, 5]
            6 : 4, // [8, 7, 6]
            7 : 3, // [8, 7]
            8 : 2  // [8]
        ]
        
        XCTAssertEqual(actual, expected)
    }
}
