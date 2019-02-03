import XCTest
@testable import SwiftAlgo

final class MergeSortTests: XCTestCase {
    
    func testSort() {
        SortTests.cases.forEach {
            var arr = $0
            arr.mergeSort()
            
            XCTAssertEqual(arr, $0.sorted())
        }
    }
    
    static var allTests = [
        ("testSort", testSort),
    ]
}
