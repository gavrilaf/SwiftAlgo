import XCTest
@testable import SwiftAlgo

final class DijkstraPathTests: XCTestCase {
    
    func testDijkstraPath1() {
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
    
    func testDijkstraPath2() {
        let g = IntEdgeGraph<Int>(edges: [
            (0, 1, 9),
            (0, 2, 6),
            (0, 3, 5),
            (0, 4, 3),
            (2, 1, 2),
            (2, 3, 4)
        ])
        
        let actual = g.buildDijkstraPathes(from: 0)
        
        let expected: [Int: Int] = [
            0 : 0,
            1 : 8,
            2 : 6,
            3 : 5,
            4 : 3
        ]
        
        XCTAssertEqual(actual, expected)
    }
    
    static var allTests = [
        ("testDijkstraPath1", testDijkstraPath1),
        ("testDijkstraPath2", testDijkstraPath2),
    ]
}
