//: [Previous](@previous)
func firstUniqChar(_ s: String) -> Int {
    if s.isEmpty { return -1 }
    var uniques: [String.Element: Int] = [:]
    var rep: Set<String.Element> = .init()

    for (i, c) in s.enumerated() {
        
        if rep.contains(c) {
            uniques.removeValue(forKey: c)
        }
        uniques[c] = i
        rep.insert(c)
    }
    let first = uniques.sorted { $0.value < $1.value }.first!.value
    return first
}

firstUniqChar("aboao")
