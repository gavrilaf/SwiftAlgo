import Foundation


func runMedian(_ fn: String) {
    print("runMedian: \(fn)")
    
    print("Open file")
    let data = try! String(contentsOfFile: fn, encoding: .ascii)
    print("Splitting by lines")
    let lines = data.components(separatedBy: .newlines)
    
    var arr = [Int]()
    arr.reserveCapacity(lines.count)
    
    var calc = MedianCalc()
    let medians = lines.compactMap { return Int($0) }.map { return calc.nextMedian(for: $0) }
    let sum = medians.reduce(0) { return $0 + $1 }
    
    print("Sun of medians is \(sum)")
}


print("ArrayRunner")

runMedian("../../../test-data/median/test/input_random_1_10.txt")


