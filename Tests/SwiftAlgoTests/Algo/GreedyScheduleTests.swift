import XCTest
@testable import SwiftAlgo

final class GreedyScheduleTests: XCTestCase {
    let cases: [([GreedySchedule.Job], Int64, Int64)] = [
        ([(w: 8, l: 50), (w: 74, l: 59), (w: 31, l: 73), (w: 45, l: 79), (w: 24, l: 10), (w: 41, l: 66),
          (w: 93, l: 43), (w: 88, l: 4), (w: 28, l: 30), (w: 41, l: 13), (w: 4, l: 70), (w: 10, l: 58)],
         68615, 67247),
        ([(w: 3, l: 1), (w: 4, l: 2), (w: 2, l: 4)], 31, 29),
    ]
    
    func testGreedyDiff() {
        cases.forEach { (cs) in
            let sorted = GreedySchedule.sortedByDiff(jobs: cs.0)
            let weightedTime = sorted.weightedCompletionTime()
            
            XCTAssertEqual(weightedTime, cs.1)
        }
    }
    
    func testGreedyRatio() {
        cases.forEach { (cs) in
            let sorted = GreedySchedule.sortedByRatio(jobs: cs.0)
            let weightedTime = sorted.weightedCompletionTime()
            
            XCTAssertEqual(weightedTime, cs.2)
        }
    }
}
