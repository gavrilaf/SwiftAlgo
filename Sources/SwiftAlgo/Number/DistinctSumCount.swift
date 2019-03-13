import Foundation

public func CalcDistictSumCountMapReduce(numbers: [Int], in range: ClosedRange<Int>) -> Int {
    let middle = range.lowerBound + range.count / 2
    let leftRange = range.lowerBound...middle
    let rightRange = middle+1...range.upperBound
    
    let map = CreateNumbersSet(from: numbers)
    
    // Map
    var results = Array<Int>(repeating: 0, count: 2)
    let group = DispatchGroup()
    
    let queue = DispatchQueue(label: "calc-queue", qos: .userInteractive, attributes: [.concurrent])
    
    let mapBlock: (ClosedRange<Int>, Int) -> Void = { (r, indx) in
        print("enter: \(indx), \(r)")
        group.enter()
        queue.async(group: group) {
            let rangeCount = CalcDistictSumCountWithMap(map, numbers: numbers, in: r)
            results[indx] = rangeCount
            print("leave: \(indx), \(r)")
            group.leave()
        }
    }
    
    mapBlock(leftRange, 0)
    mapBlock(rightRange, 1)
    
    group.wait()
    
    // Reduce
    let count = results.reduce(0) { $0 + $1 }
    
    return count
}

public func CalcDistictSumCount(numbers: [Int], in range: ClosedRange<Int>) -> Int {
    let map = CreateNumbersSet(from: numbers)
    return CalcDistictSumCountWithMap(map, numbers: numbers, in: range)
}

func CreateNumbersSet(from numbers: [Int]) -> Dictionary<Int, Bool> {
    var map = Dictionary<Int, Bool>()
    numbers.forEach {
        if let v = map[$0], v == false {
            map[$0] = true // dublicate
        } else {
            map[$0] = false
        }
    }
    
    return map
}

func CalcDistictSumCountWithMap(_ map: Dictionary<Int, Bool>, numbers: [Int], in range: ClosedRange<Int>) -> Int {
    var count = 0
    for t in range {
        var found = false
        for num in numbers {
            let diff = t - num
            if let duplicateExists = map[diff] {
                if diff != num || (diff == num && duplicateExists) {
                    found = true
                    break
                }
            }
        }
        
        if found {
            count += 1
        }
    }
    
    return count
}
