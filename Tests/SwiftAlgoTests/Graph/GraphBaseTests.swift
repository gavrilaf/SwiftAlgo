import XCTest
@testable import SwiftAlgo

final class GraphBaseTests: XCTestCase {
    
    var subject: StaticEdgeGraph<Int>!
    
    override func setUp() {
        subject = StaticEdgeGraph<Int>()
        
        subject.addEdge(from: 1, to: 2)
        subject.addEdge(from: 1, to: 3)
        subject.addEdge(from: 2, to: 3)
        subject.addEdge(from: 3, to: 4)
    }
    
    func testGetFirstNode() {
        XCTAssertNotNil(subject.first)
    }
    
    func testGetAllNodes() {
        let allNodes = subject.allNodes
        
        let nodesSet = Set(allNodes.map { return $0.vertex })
        let expected = Set([1, 2, 3, 4])
        
        XCTAssertEqual(nodesSet, expected)
    }
    
    func testGetNodeByVertex() {
        let node = subject.node(byVertex: 1)
        XCTAssertEqual(node?.vertex, 1)
    }
    
    static var allTests = [
        ("testGetFirstNode", testGetFirstNode),
        ("testGetAllNodes", testGetAllNodes),
        ("testGetFirstNode", testGetFirstNode),
    ]
}
