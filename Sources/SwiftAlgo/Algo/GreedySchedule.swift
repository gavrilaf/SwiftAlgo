import Foundation

public struct GreedySchedule {
    public typealias Job = (w: Int, l: Int)
    
    public static func sortedByDiff(jobs: [Job]) -> [Job] {
        return jobs.sorted(by: { return isGreaterByDiff(lhs: $0, rhs: $1) })
    }
    
    public static func sortedByRatio(jobs: [Job]) -> [Job] {
        return jobs.sorted(by: { return isGreaterByRatio(lhs: $0, rhs: $1) })
    }
    
    public static func isGreaterByDiff(lhs: Job, rhs: Job) -> Bool {
        return (lhs.w - lhs.l) > (rhs.w - rhs.l) || ( (lhs.w - lhs.l) == (rhs.w - rhs.l) && (lhs.w > rhs.w))
    }
    
    public static func isGreaterByRatio(lhs: Job, rhs: Job) -> Bool {
        return Double(lhs.w)/Double(lhs.l) > Double(rhs.w)/Double(rhs.l)
    }
}

public extension Array where Element == GreedySchedule.Job {
    public func weightedCompletionTime() -> Int64 {
        var tm = 0
        var result: Int64 = 0
        
        for job in self {
            tm += job.l
            result += Int64(job.w) * Int64(tm)
        }
        
        return result
    }
}
