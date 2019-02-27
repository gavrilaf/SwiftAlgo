import XCTest

#if !os(macOS)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(QuickSortTests.allTests),
        testCase(MergeSortTests.allTests),
        testCase(HeapSortTests.allTests),
        testCase(QueueTests.allTests),
        testCase(StackTests.allTests),
        testCase(GraphBaseTests.allTests),
    ]
}
#endif
