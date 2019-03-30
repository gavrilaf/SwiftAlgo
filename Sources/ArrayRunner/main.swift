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

func readJobsFile(_ fn: String) -> [(weight: Int, length: Int)] {
    print("Open file")
    let data = try! String(contentsOfFile: fn, encoding: .ascii)
    print("Splitting by lines")
    let lines = data.components(separatedBy: .newlines)
    
    var result = [(weight: Int, length: Int)]()
    lines[1...].forEach { (line) in
        let s = line.trimmingCharacters(in: .whitespaces)
        if !s.isEmpty {
            let row = s.components(separatedBy: .whitespaces).compactMap { return Int($0) }
            if row.count == 2 {
                result.append((weight: row[0], length: row[1]))
            }
        }
    }

    return result
}

func runMedian(_ fn: String) {
    print("runMedian: \(fn)")
    
    let arr = readArray(fn)
    
    var calc = MedianMaintenance()
    let medians = arr.map { return calc.next(for: $0) }
    
    let sum = medians.reduce(0) { return $0 + $1 } % 10000
    print("Sun of medians is \(sum)")
}

func runJobsScheduler(_ fn: String) {
    print("runJobsScheduler: \(fn)")
}


print("ArrayRunner")

//runMedian("../../../test-data/median/test/input_random_1_10.txt")
//runMedian("../../../test-data/median/test/input_random_44_10000.txt")
runMedian("../../../test-data/median/median.txt")






