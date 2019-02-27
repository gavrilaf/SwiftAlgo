import Foundation

struct BinaryHeap<E> {
    public init(cmp: @escaping (E, E) -> Bool) {
        self.isBefore = cmp
        self.elements = []
        self.count = 0
    }
    
    public init(array: [E], cmp: @escaping (E, E) -> Bool) {
        self.isBefore = cmp
        self.elements = array
        self.count = elements.count
        
        if self.count > 1 {
            elements.withUnsafeMutableBufferPointer { (buf) in
                BinaryHeap.heapify(buffer: &buf, cmp: cmp)
            }
        }
    }
    
    // MARK: Heap
    
    public mutating func push(_ e: E) {
        if count < elements.count {
            elements[count] = e
        } else {
            elements.append(e)
        }
        
        count += 1
        shiftUp(count-1)
    }
    
    public mutating func pop() -> E? {
        guard let p = top else { return nil }
        
        if count > 1 {
            elements.swapAt(0, count-1)
            count -= 1
            shiftDown(0)
        } else {
            count -= 1
        }
        
        return p
    }
    
    public var top: E? {
        return count == 0 ? nil : elements[0]
    }
    
    public var isEmpty: Bool {
        return size == 0
    }
    
    public var size: Int {
        return count
    }
    
    // MARK: Utility
    public mutating func clear() {
        elements.removeAll()
        count = 0
    }
    
    // MARK:
    private let isBefore: (E, E) -> Bool
    
    private var elements: [E]
    private var count = 0
}


extension BinaryHeap {
    
    mutating func shiftUp(_ indx: Int) {
        let cmp = isBefore
        elements.withUnsafeMutableBufferPointer { buf in
            BinaryHeap.shiftUp(buffer: &buf, index: indx, cmp: cmp)
        }
    }
    
    mutating func shiftDown(_ indx: Int) {
        let cmp = isBefore
        elements.withUnsafeMutableBufferPointer { buf in
            BinaryHeap.shiftDown(buffer: &buf, index: indx, heapSize: count, cmp: cmp)
        }
    }
    
    // MARK:- Static heap unsafe helpers
    
    @inline(__always) static func parentIndex(of indx: Int) -> Int {
        return (indx - 1) / 2
    }
    
    @inline(__always) static func leftIndex(of indx: Int) -> Int {
        return 2*indx + 1
    }
    
    @inline(__always) static func rightIndex(of indx: Int) -> Int {
        return 2*indx + 2
    }
    
    static func heapify(buffer: inout UnsafeMutableBufferPointer<E>, cmp: (E, E) -> Bool) {
        guard buffer.count > 0 else { return }
        
        for i in stride(from: (buffer.count/2 - 1), through: 0, by: -1) {
            shiftDown(buffer: &buffer, index: i, heapSize: buffer.count, cmp: cmp)
        }
    }
    
    static func shiftUp(buffer: inout UnsafeMutableBufferPointer<E>, index: Int, cmp: (E, E) -> Bool) {
        var childIndx = index
        
        let child = buffer[childIndx]
        var parentIndx = parentIndex(of: childIndx)
        
        while childIndx > 0 && !cmp(child, buffer[parentIndx]) {
            buffer[childIndx] = buffer[parentIndx]
            childIndx = parentIndx
            parentIndx = parentIndex(of: childIndx)
        }
        
        buffer[childIndx] = child
    }
    
    static func shiftDown(buffer: inout UnsafeMutableBufferPointer<E>, index: Int, heapSize: Int, cmp: (E, E) -> Bool) {
        var parentIndx = index
        
        while parentIndx < heapSize {
            let leftIndx = leftIndex(of: parentIndx)
            let rightIndx = leftIndx + 1
            var firstIndx = parentIndx
            
            if leftIndx < heapSize && cmp(buffer[firstIndx], buffer[leftIndx]) {
                firstIndx = leftIndx
            }
            
            if rightIndx < heapSize && cmp(buffer[firstIndx], buffer[rightIndx]) {
                firstIndx = rightIndx
            }
            
            if firstIndx == parentIndx { break }
            
            swap(&buffer[parentIndx], &buffer[firstIndx])
            parentIndx = firstIndx
        }
    }
}
