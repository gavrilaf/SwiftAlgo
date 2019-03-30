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


print("ArrayRunner")

//runMedian("../../../test-data/median/test/input_random_1_10.txt")
//runMedian("../../../test-data/median/test/input_random_44_10000.txt")
runMedian("../../../test-data/median/median.txt")






