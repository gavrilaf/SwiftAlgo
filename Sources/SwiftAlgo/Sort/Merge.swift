import Foundation

extension Array where Element: Comparable {
    public mutating func mergeSort() {
        var temp = self
        _mergeSort(&temp, left: 0, right: self.count - 1)
    }
    
    // MARK: - Implementation
    private mutating func _mergeSort(_ temp: inout [Element], left: Int, right: Int) {
        guard left < right else { return }
        
        let mid = (right + left) / 2
        
        _mergeSort(&temp, left: left, right: mid)
        _mergeSort(&temp, left: mid + 1 , right: right)
        
        _merge(&temp, left: left, mid: mid, right: right)
    }
    
    private mutating func _merge(_ temp: inout [Element], left: Int, mid: Int, right: Int) {
        var i = left
        var j = mid + 1
        var k = 0
        
        while i <= mid && j <= right {
            if self[i] < self[j] {
                temp[k] = self[i]
                i += 1
            } else {
                temp[k] = self[j]
                j += 1
            }
            k += 1
        }
        
        while i <= mid {
            temp[k] = self[i]
            i += 1
            k += 1
        }
        
        while j <= right {
            temp[k] = self[j]
            j += 1
            k += 1
        }
        
        for i in left...right {
            self[i] = temp[i - left]
        }
    }
}
