import Foundation
import SwiftPerfTool
import SwiftAlgo

func readArray(_ fn: String) -> [Int] {
    print("Open file")
    let data = try! String(contentsOfFile: fn, encoding: .ascii)
    print("Splitting by lines")
    let lines = data.components(separatedBy: .newlines)
    return lines.compactMap { Int($0) }
}


func runMedian(_ fn: String) {
    print("runMedian: \(fn)")
    
    let arr = readArray(fn)
    
    var calc = MedianMaintenance()
    let medians = arr.map { return calc.next(for: $0) }
    
    let sum = medians.reduce(0) { return $0 + $1 } % 10000
    print("Sun of medians is \(sum)")
}


func runTwoSumCount(_ fn: String) {
    print("runTwoSumCount: \(fn)")
    
    let arr = readArray(fn)
    let range = -10000...10000
    
    print("Array prepared")
    
    var count1 = 0
    let metrics1 = runMeasure(with: SPTConfig(iterations: 1, trials: [{ count1 = CalcDistictSumCount(numbers: arr, in: range) }] ))
    
    print("Done! CalcDistictSumCount: \(count1)")
    print("Time = \(metrics1.timeMean), scores = \(metrics1.timeScores)")
    
    var count2 = 0
    let metrics2 = runMeasure(with: SPTConfig(iterations: 1, trials: [{ count2 = CalcDistictSumCountMapReduce(numbers: arr, in: range) }] ))
    
    print("Done! CalcDistictSumCountMapReduce: \(count2)")
    print("Time = \(metrics2.timeMean), scores = \(metrics2.timeScores)")
}


print("ArrayRunner")

//runMedian("../../../test-data/median/test/input_random_1_10.txt")
//runMedian("../../../test-data/median/test/input_random_44_10000.txt")
//runMedian("../../../test-data/median/median.txt")

//runTwoSumCount("../../../test-data/two-sum/input_random_1_10.txt")
runTwoSumCount("../../../test-data/two-sum/input_random_41_10000.txt")





