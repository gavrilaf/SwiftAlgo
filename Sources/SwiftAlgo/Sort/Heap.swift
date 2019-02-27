import Foundation

extension Array where Element: Comparable {
    public mutating func heapSort() {
        let cmp: (Element, Element) -> Bool = { return $0 < $1 }
        
        self.withUnsafeMutableBufferPointer { (buffer) in
            BinaryHeap.heapify(buffer: &buffer, cmp: cmp)
            for i in stride(from: buffer.count - 1, through: 1, by: -1) {
                swap(&buffer[0], &buffer[i])
                BinaryHeap.shiftDown(buffer: &buffer, index: 0, heapSize: i, cmp: cmp)
            }
        }
    }
}


