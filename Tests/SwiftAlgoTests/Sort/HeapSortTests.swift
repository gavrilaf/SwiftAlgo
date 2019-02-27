import XCTest
@testable import SwiftAlgo

final class HeapSortTests: XCTestCase {
    
    func testSort() {
        SortTests.cases.forEach {
            var arr = $0
            arr.heapSort()
            
            XCTAssertEqual(arr, $0.sorted())
        }
    }
    
    static var allTests = [
        ("testSort", testSort),
    ]
}

