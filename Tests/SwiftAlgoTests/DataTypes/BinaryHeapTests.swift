import XCTest
@testable import SwiftAlgo

final class BinaryHeapTests: XCTestCase {

    func testMaxBinaryHeap() {
        var heap = BinaryHeap<Int>(cmp: { return $0 < $1 })
        
        heap.push(2)
        heap.push(1)
        heap.push(4)
        heap.push(5)
        heap.push(3)
        
        XCTAssertEqual(heap.top, 5)
        
        _ = heap.pop()
        _ = heap.pop()
        
        XCTAssertEqual(heap.top, 3)
        XCTAssertEqual(heap.size, 3)
        XCTAssertFalse(heap.isEmpty)
        
        heap.push(1093)
        heap.push(112)
        
        XCTAssertEqual(heap.pop(), 1093)
        XCTAssertEqual(heap.top, 112)
        
        _ = heap.pop()
        _ = heap.pop()
        _ = heap.pop()
        
        XCTAssertEqual(heap.pop(), 1)
        
        XCTAssertNil(heap.pop())
        XCTAssertNil(heap.top)
        
        XCTAssertEqual(heap.size, 0)
        XCTAssertEqual(heap.isEmpty, true)
        
        heap.push(1000)
        XCTAssertEqual(heap.top, 1000)
        XCTAssertEqual(heap.pop(), 1000)
        XCTAssertNil(heap.pop())
    }
    
    func testMinBinaryHeap() {
        var heap = BinaryHeap<Int>(cmp: { return $0 > $1 })
        
        heap.push(2)
        heap.push(1)
        heap.push(4)
        heap.push(5)
        heap.push(3)
        heap.push(3)
        
        XCTAssertEqual(heap.top, 1)
        XCTAssertEqual(heap.pop(), 1)
        XCTAssertEqual(heap.pop(), 2)
        XCTAssertEqual(heap.pop(), 3)
        XCTAssertEqual(heap.pop(), 3)
        XCTAssertEqual(heap.pop(), 4)
        XCTAssertEqual(heap.pop(), 5)
        XCTAssertNil(heap.pop())
    }
    
    func testBuildMinBinaryHeap() {
        var heap = BinaryHeap<Int>(array: [4, 6, 190, 1, 12], cmp: { return $0 > $1 })
        
        XCTAssertEqual(heap.pop(), 1)
        XCTAssertEqual(heap.pop(), 4)
        XCTAssertEqual(heap.pop(), 6)
        XCTAssertEqual(heap.pop(), 12)
        XCTAssertEqual(heap.pop(), 190)
    }

    static var allTests = [
        ("testMaxBinaryHeap", testMaxBinaryHeap),
        ("testMinBinaryHeap", testMinBinaryHeap),
        ("testBuildMinBinaryHeap", testBuildMinBinaryHeap),
    ]
}

