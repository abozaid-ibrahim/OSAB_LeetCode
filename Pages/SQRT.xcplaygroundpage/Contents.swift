//

func mySqrt(_ x: Int) -> Int {
    if x < 1 { return 0 }
    if x < 4 { return 1 }
    var low = 2

    var high = (x / 2)
    while low <= high {
        let mid = (low + high) / 2
        let target = mid.sqr
        if x == target || (target < x && (mid + 1).sqr > x) {
            return Int(mid)
        } else if target > x {
            high = mid
        } else {
            low = mid
        }
    }

    return 1
}

extension Int {
    var sqr: Self { self * self }
}
