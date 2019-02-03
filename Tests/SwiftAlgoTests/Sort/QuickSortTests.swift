import XCTest
@testable import SwiftAlgo

final class QuickSortTests: XCTestCase {
    
    func testSort() {
        SortTests.cases.forEach {
            var arr = $0
            arr.quickSort()
            
            XCTAssertEqual(arr, $0.sorted())
        }
    }
    
    static var allTests = [
        ("testSort", testSort),
    ]
}

