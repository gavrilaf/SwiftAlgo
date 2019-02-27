import XCTest
@testable import SwiftAlgo

final class StackTests: XCTestCase {
    
    func testStackBase() {
        let stack = Stack<Int>()
        
        XCTAssertTrue(stack.isEmpty)
        XCTAssertNil(stack.top)
        
        stack.push(1)
        stack.push(2)
        
        XCTAssertFalse(stack.isEmpty)
        XCTAssertEqual(stack.top, 2)
        
        XCTAssertEqual(stack.pop(), 2)
        XCTAssertEqual(stack.pop(), 1)
        
        XCTAssertNil(stack.pop())
        
        XCTAssertTrue(stack.isEmpty)
        XCTAssertNil(stack.top)
    }
    
    func testStackBig() {
        let size = 10000
        
        let stack = Stack<Int>()
        
        (1...size).forEach { stack.push($0) }
        XCTAssertEqual(stack.top, size)
        
        (1...size-1).forEach { _ in stack.pop() }
        XCTAssertEqual(stack.top, 1)
        XCTAssertEqual(stack.pop(), 1)
        
        XCTAssertTrue(stack.isEmpty)
    }
    

    static var allTests = [
        ("testStackBase", testStackBase),
        ("testStackBig", testStackBig),
    ]
}
