import Foundation

extension Array where Element: Comparable {
    public mutating func quickSort() {
        _quickSort(left: 0, right: self.count - 1)
    }
    
    // MARK: - Implementation
    private mutating func _quickSort(left: Int, right: Int) {
        guard left < right else { return }
        
        if right - left > 5 {
            let pivot = Int.random(in: left...right)
            if pivot != left {
                self.swapAt(left, pivot)
            }
        }
        
        let p = partition(left: left, right: right)
        
        _quickSort(left: left, right: p - 1)
        _quickSort(left: p + 1, right: right)
    }
    
    private mutating func partition(left: Int, right: Int) -> Int {
        let p = self[left]
        var i = left + 1
        
        for j in i...right {
            if self[j] < p {
                self.swapAt(i, j)
                i += 1
            }
        }
        
        self.swapAt(left, i - 1)
        return i - 1
    }
}

