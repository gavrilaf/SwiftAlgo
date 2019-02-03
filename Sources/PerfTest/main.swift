import Foundation
import SwiftAlgo
import SwiftPerfTool

func testSort() {
    let bunchSise = 10000
    
    print("Generate test data")
    let sorted = (0...bunchSise).map { return $0 }
    let reversed = [Int](sorted.reversed())
    let random = sorted.shuffled()
    
    struct Try {
        let name: String
        let arr: [Int]
        let call: (inout [Int]) -> Void
    }
    
    func run(_ tr: Try) {
        var copy = tr.arr
        tr.call(&copy)
    }
    
    let cases: [Try] = [
        Try(name: "merge, sorted", arr: sorted, call: { $0.mergeSort() }),
        Try(name: "merge, reversed", arr: reversed, call: { $0.mergeSort() }),
        Try(name: "merge, random", arr: random, call: { $0.mergeSort() }),
        
        Try(name: "quick, sorted", arr: sorted, call: { $0.quickSort() }),
        Try(name: "quick, reversed", arr: reversed, call: { $0.quickSort() }),
        Try(name: "quick, random", arr: random, call: { $0.quickSort() }),
        
        Try(name: "lib, sorted", arr: sorted, call: { $0.sort() }),
        Try(name: "lib, reversed", arr: reversed, call: { $0.sort() }),
        Try(name: "lib, random", arr: random, call: { $0.sort() }),
    ]
    
    cases.forEach { t in
        let metrics = runMeasure(with: SPTConfig(iterations: 100, trials: [{ run(t) }] ))
        print("\(t.name). Mean time = \(metrics.timeMean), scores = \(metrics.timeScores)")
    }
}

testSort()


