import XCTest

#if !os(macOS)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(QuickSortTests.allTests),
        testCase(MergeSortTests.allTests),
        testCase(HeapSortTests.allTests),
        
        testCase(QueueTests.allTests),
        testCase(StackTests.allTests),
        testCase(BinaryHeapTests.allTests),
        
        testCase(GraphBaseTests.allTests),
        testCase(GraphSCCTests.allTests),
        testCase(GraphTransformationTests.allTests),
        testCase(DijkstraPathTests.allTests),
        
        testCase(MedianMaintenanceTests.allTests),
        testCase(DistinctSumCountTests.allTests),
        
        testCase(CollectionSplitTests.allTests),
    ]
}
#endif
