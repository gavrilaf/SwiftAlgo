import XCTest
@testable import SwiftAlgo

final class GraphTransformationTests: XCTestCase {
    
    var subject1: StaticEdgeGraph<Int>!
    var subject2: StaticEdgeGraph<Int>!
    
    override func setUp() {
        subject1 = StaticEdgeGraph<Int>(edges: [(1, 2), (2, 3), (3, 4), (4, 1)])
        subject2 = StaticEdgeGraph<Int>(edges: [(1, 2), (1, 3), (2, 4), (3, 4)])
    }
    
    func testCopy() {
        let copy1 = subject1.copy()
        let copy2 = subject2.copy()
        
        XCTAssertEqual(subject1, copy1)
        XCTAssertEqual(subject2, copy2)
    }
    
    func testReverseCopy() {
        let expected1 = StaticEdgeGraph<Int>(edges: [(1, 4), (2, 1), (3, 2), (4, 3)])
        let expected2 = StaticEdgeGraph<Int>(edges: [(2, 1), (3, 1), (4, 2), (4, 3)])
        
        let reversed1 = subject1.reverseCopy()
        let reversed2 = subject2.reverseCopy()
        
        XCTAssertEqual(expected1, reversed1)
        XCTAssertEqual(expected2, reversed2)
    }
}



