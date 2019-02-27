import XCTest
@testable import SwiftAlgo

final class QueueTests: XCTestCase {
    
    func testQueueBase() {
        let queue = Queue<Int>()
        
        XCTAssertTrue(queue.isEmpty)
        XCTAssertNil(queue.head)
        
        queue.push(1)
        queue.push(2)
        
        XCTAssertFalse(queue.isEmpty)
        XCTAssertEqual(queue.head, 1)
        
        XCTAssertEqual(queue.pop(), 1)
        XCTAssertEqual(queue.pop(), 2)
        
        XCTAssertNil(queue.pop())
        
        XCTAssertTrue(queue.isEmpty)
        XCTAssertNil(queue.head)
    }
    
    func testQueueBig() {
        let size = 10000
        
        let queue = Queue<Int>()
        
        (1...size).forEach { queue.push($0) }
        XCTAssertEqual(queue.head, 1)
        
        (1...size-1).forEach { _ in queue.pop() }
        XCTAssertEqual(queue.head, size)
        XCTAssertEqual(queue.pop(), size)
        
        XCTAssertTrue(queue.isEmpty)
    }
    
    
    static var allTests = [
        ("testQueueBase", testQueueBase),
        ("testQueueBig", testQueueBig),
    ]
}
