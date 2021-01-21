
func strStr(_ haystack: String, _ needle: String) -> Int {
    if haystack == needle { return 0 }
    if needle.isEmpty { return 0 }
    let characters = Array(haystack)
    var resultIndex = 0
    let c = characters.count - 1
    var i = 0

    while (c - i + 1) >= needle.count && String(characters[i ... (i + needle.count - 1)]) != needle {
        i += 1
        resultIndex += 1
    }

    return (c - i + 1) < needle.count ? -1 : resultIndex
}

func strStr1(_ haystack: String, _ needle: String) -> Int {
    if haystack == needle { return 0 }
    var characters = Array(haystack)
    var resultIndex = 0
    while characters.count >= needle.count && !String(characters).hasPrefix(needle) {
        characters.removeFirst()
        resultIndex += 1
    }

    return characters.count < needle.count ? -1 : resultIndex
}

strStr("mississippi", "issip")
// hint create extension to build a sub string from a range
