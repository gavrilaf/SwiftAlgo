import XCTest
@testable import SwiftAlgo

final class MedianMaintenanceTests: XCTestCase {
    
    func testCornerCases() {
        let input: [Int] =    [1, 2, 3, 4]
        let expected: [Int] = [1, 1, 2, 2]
        
        var mcalc = MedianMaintenance()
        
        let actual = input.map { return mcalc.next(for: $0) }
        XCTAssertEqual(actual, expected)
    }
    
    func testMedianMaintenance() {
        let input: [Int] =    [23, 9, 35, 4, 13 ,24, 2,  5, 27, 1, 34, 8, 15, 39, 32, 22, 29, 21, 19, 20, 36, 33, 7,  31, 14, 17, 26, 16, 38, 6]
        let expected: [Int] = [23, 9, 23, 9, 13, 13, 13, 9, 13, 9, 13, 9, 13, 13, 15, 15, 22, 21, 21, 20, 21, 21, 21, 21, 21, 20, 21, 20, 21, 20]
        
        var mcalc = MedianMaintenance()
        
        let actual = input.map { return mcalc.next(for: $0) }
        XCTAssertEqual(actual, expected)
    }
    
    static var allTests = [
        ("testCornerCases", testCornerCases),
        ("testMedianMaintenance", testMedianMaintenance),
    ]
}
