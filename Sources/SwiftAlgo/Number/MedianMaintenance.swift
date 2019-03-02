
/*
 Find medians for the numbers sequence
 
 The goal of this problem is to implement the "Median Maintenance" algorithm.
 The text file contains a list of the integers from 1 to 10000 in unsorted order; you should treat this as a stream of numbers,
 arriving one by one.
 
 if k is odd, then median is the (k+1)/2 smallest number among x_1, ... ,x_k
 if kk is even, then median is the k/2 smallest number among x_1, ... ,x_k
 */

public struct MedianMaintenance {
    
    public init() {}
    
    /*
     For the first two elements add smaller one to the maxHeap on the left, and bigger one to the minHeap on the right. Then process stream data one by one,
     
     Step 1: Add next item to one of the heaps
     
     if next item is smaller than maxHeap root add it to maxHeap,
     else add it to minHeap
     
     Step 2: Balance the heaps (after this step heaps will be either balanced or one of them will contain 1 more item)
     
     if number of elements in one of the heaps is greater than the other by
     more than 1, remove the root element from the one containing more elements and
     add to the other one
     Then at any given time you can calculate median like this:
     
     If the heaps contain equal amount of elements;
        should be median = (root of maxHeap + root of minHeap)/2, but in our case median is top of the smallest heap
     Else
        median = root of the heap with more elements
     */
    
    public mutating func next(for value: Int) -> Int {
        if counter == 0 {
            initValues[counter] = value
            counter += 1
            return value
        } else if counter == 1 {
            initValues[counter] = value
            minHeap.push(initValues.max()!)
            maxHeap.push(initValues.min()!)
            counter += 1
            return initValues.min()!
        } else {
            if value < maxHeap.top! {
                maxHeap.push(value)
            } else {
                minHeap.push(value)
            }
            
            if maxHeap.size > minHeap.size {
                minHeap.push(maxHeap.pop()!)
            } else if maxHeap.size < minHeap.size {
                maxHeap.push(minHeap.pop()!)
            }
            
            if maxHeap.size == minHeap.size {
                return maxHeap.top! //(maxHeap.top! + minHeap.top!) / 2
            } else if maxHeap.size > minHeap.size {
                return maxHeap.top!
            } else {
                return minHeap.top!
            }
        }
    }
    
    private var initValues = [Int](repeating: 0, count: 2)
    private var counter = 0
    
    private var maxHeap = BinaryHeap<Int>(cmp: { $0 < $1 })
    private var minHeap = BinaryHeap<Int>(cmp: { $0 > $1 })
}
